

resource "aws_key_pair" "local_key" {
  key_name = var.key_pair_name
  public_key = file(var.key_pair_file)
}

resource "aws_instance" "web_server" {
  count = var.numberof_instance

  ami = var.ami_id
  instance_type = var.instance_type

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 20

  }
  #  root_block_device {
  #    delete_on_termination = true
  #    volume_size = 30
  #    volume_type = "gp2"
  #  }

  key_name = aws_key_pair.local_key.key_name
  vpc_security_group_ids = [var.security_group_id]

  # Plusieurs instances peuvent être créées pour 3 subnets max
  subnet_id = var.public_subnet_ids[count.index % length(var.public_subnet_ids)]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.instance_name} #${count.index}"
    Environment = terraform.workspace
    OS          = "UBUNTU"
    Managed     = "IAC Terraform"
  }
}
