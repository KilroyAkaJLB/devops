
variable "region" {
  type = string
}

# VPC
variable "vpc_cidr" {
  type = string
  description = "CIDR principal"
}

variable "public_subnet" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
  description = "Liste des subnets publics"
}
variable "private_subnet" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name       = string
  }))
  description = "Liste des subnets privés"
}

# EC2
variable "ami_id" {
  description = "AMI ID pour EC2"
  type = string
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  type = string
  description = "Instance EC2"
  default = "t3.micro"
}
variable "db_instance_type" {
  type = string
  description = "Instance RDS"
  default = "t3.micro"
}

variable "key_pair_name" {
  type = string
  description = "Nom de la cé SSH pour l'instance"
}
variable "key_pair_file" {
  type = string
  description = "Nom complet du ficher de la clé publique"
}

# RDS
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