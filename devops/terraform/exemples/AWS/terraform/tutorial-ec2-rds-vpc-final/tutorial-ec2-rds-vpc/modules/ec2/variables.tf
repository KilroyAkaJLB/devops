
variable "ami_id" {
  description = "AMI ID pour EC2"
  type = string
}

variable "vpc_id" {
  type = string
  description = "VPC ID créé dans le module VPC"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "Public subnet IDs (liste) créés dans le module VPC"
}

variable "security_group_id" {
  type = string
  description = "Security Group pour EC2 créé dans le module VPC"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type pour EC2"
}

variable "key_pair_name" {
  description = "Nom de la cé SSH pour l'instance"
}
variable "key_pair_file" {
  description = "Nom complet du ficher de la clé publique"
}