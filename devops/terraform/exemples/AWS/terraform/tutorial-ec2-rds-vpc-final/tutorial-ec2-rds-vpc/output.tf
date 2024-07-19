
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.ec2.instance_private_ip
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.ec2.instance_public_ip
}
output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = module.ec2.instance_public_dns
}

output "database_endpoint" {
  description = "Endpoint of database"
  value = module.rds.database_endpoint
}



#output "vpc_subnet_public_ids" {
#  value = module.vpc.subnet_public_ids
#}
