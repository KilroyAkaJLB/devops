
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.aws_instance.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.aws_instance.instance_private_ip
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.aws_instance.instance_public_ip
}

output "ami_debian_image_id" {
  value = module.aws_instance.ami_debian_image_id
}

output "default_security_group" {
  value = module.aws_instance.default_security_group
}