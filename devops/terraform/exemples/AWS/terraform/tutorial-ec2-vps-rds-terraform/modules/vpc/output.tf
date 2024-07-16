
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public_ids" {
  value = values(aws_subnet.public)[*].id
}
output "subnet_private_ids" {
  value = values(aws_subnet.private)[*].id
}

output "ec2_security_group_id" {
  value = aws_security_group.security_group_ec2.id
}

output "db_security_group_id" {
  value = aws_security_group.security_group_rds.id
}