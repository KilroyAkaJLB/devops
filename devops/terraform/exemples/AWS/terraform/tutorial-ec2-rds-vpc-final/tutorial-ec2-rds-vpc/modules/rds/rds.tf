
# Voir https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds

resource "aws_db_subnet_group" "db" {
  subnet_ids = var.private_subnet_ids

  description = "${terraform.workspace} DB Subnet Group"
  tags = {
    Name = "${terraform.workspace} DB Subnet Group"
  }
}

resource "aws_db_parameter_group" "mysql" {
  name   = "rds-mysql8-0"
  family = "mysql8.0"

  # Activer la création de Trigger
  parameter {
    name  = "log_bin_trust_function_creators"
    value = 1
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_type
  username             = var.db_user
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.mysql.name
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.db.name
  vpc_security_group_ids = [var.db_security_group_id]
}
