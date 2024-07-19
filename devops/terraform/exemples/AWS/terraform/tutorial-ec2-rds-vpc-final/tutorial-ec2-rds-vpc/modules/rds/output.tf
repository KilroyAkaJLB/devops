
output "database_endpoint" {
  description = "Endpoint of database"
  value = aws_db_instance.mysql.address
}
