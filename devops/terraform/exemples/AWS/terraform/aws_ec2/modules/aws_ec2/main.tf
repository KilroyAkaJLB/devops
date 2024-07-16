
data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-12-amd64*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-id"
    values = ["136693071363"] // Debian
  }

  owners = ["amazon"]
}

data "aws_security_group" "default" {
  name = "default"
}

resource "aws_key_pair" "local_key" {
  key_name = var.key_pair_name
  public_key = file(var.key_pair_file)
}

resource "aws_instance" "web_server" {
  #ami = data.aws_ami.debian.image_id
  ami = "ami-0506d6d51f1916a96"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20

  }

  key_name = aws_key_pair.local_key.key_name
  vpc_security_group_ids = [data.aws_security_group.default.id]
}
