
variable "region" {
  type = string
}

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