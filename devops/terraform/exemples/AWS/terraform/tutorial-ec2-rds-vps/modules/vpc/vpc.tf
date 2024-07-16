
# 1 - Création du VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = terraform.workspace
  }
}

# 2 - Création des subnets
resource "aws_subnet" "public" {
  for_each = { for vpc in var.public_subnet: vpc.name => vpc}

  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${terraform.workspace} Public subnet ${each.value.name}"
  }
}

resource "aws_subnet" "private" {
  for_each = { for vpc in var.private_subnet: vpc.name => vpc}

  vpc_id = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${terraform.workspace} Private subnet ${each.value.name}"
  }
}

# 3 - Création de la gateway publique
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${terraform.workspace} VPC Gateway"
  }
}

# 4 - Création de la route publique
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "${terraform.workspace} Public route"
  }
}

# 5 - Création de l'association subnet public / route publique
resource "aws_route_table_association" "public_subnet_route" {
  #for_each = { for subnet in aws_subnet.public: subnet.id => subnet}
  for_each = { for vpc in var.public_subnet: vpc.name => vpc}

  route_table_id = aws_route_table.public_route.id
  #subnet_id = each.value.id
  subnet_id = aws_subnet.public[each.key].id
}

# 6 - Création des security group
resource "aws_security_group" "security_group_ec2" {
  vpc_id = aws_vpc.main.id
  name = "${terraform.workspace}-sg-ec2"

  # EC2
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["88.173.252.190/32", "195.15.137.164/32"]
    description = "Mac maison/travail"
  }
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "any"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "any"
  }

  description = "${terraform.workspace} Security Group for SSH and HTTP"
  tags = {
    Name = "${terraform.workspace} Security Group"
  }
}

# 7 - Création du security group pour RDS
resource "aws_security_group" "security_group_rds" {
  vpc_id = aws_vpc.main.id
  name = "${terraform.workspace}-sg-rds-mysql"

  ingress {
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    security_groups = [aws_security_group.security_group_ec2.id]
    description = "Autorise le traffic MySQl via EC2 security group"
  }

  description = "${terraform.workspace} Security Group for RDS"
  tags = {
    Name = "${terraform.workspace} Security Group"
  }
}

/*
resource "aws_security_group_rule" "inbound_mysql" {
  security_group_id = aws_security_group.security_group_rds.id
  type              = "ingress"
  protocol    = "tcp"
  from_port   = 3306
  to_port     = 3306
  source_security_group_id = aws_security_group.security_group_ec2.id
}
*/