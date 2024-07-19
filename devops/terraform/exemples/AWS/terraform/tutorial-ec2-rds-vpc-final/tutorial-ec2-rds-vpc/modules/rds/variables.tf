
variable "private_subnet_ids" {
  type = list(string)
  description = "Private subnet IDs (liste) créés dans le module VPC"
}

variable "db_security_group_id" {
  type = string
  description = "DB Security Group créé ans la module VPC"
}

variable "instance_type" {
  description = "Instance type pour RDS"
}

variable "db_name" {
  type = string
  description = "RDS db name"
}

variable "db_user" {
  type = string
  description = "RDS user"
  sensitive   = true
}

variable "db_password" {
  type = string
  description = "RDS user password"
  sensitive   = true
}