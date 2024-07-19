

resource "aws_key_pair" "local_key" {
  key_name = var.key_pair_name
  public_key = file(var.key_pair_file)
}

resource "aws_instance" "web_server" {
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
  # Une seule instance est créée donc on ne prend qu'un seul subnet
  subnet_id = var.public_subnet_ids[0]
  associate_public_ip_address = true
  //security_groups =


  tags = {
    Name        = var.instance_name
    Environment = terraform.workspace
    OS          = "UBUNTU"
    Managed     = "IAC"
  }
}
