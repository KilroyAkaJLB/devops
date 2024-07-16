
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "Instance EC2"
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "Nom de la cé SSH pour l'instance"
}
variable "key_pair_file" {
  description = "Nom complet du ficher de la clé publique"
}