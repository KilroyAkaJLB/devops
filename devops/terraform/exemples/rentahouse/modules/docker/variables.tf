# Docker
variable "docker_config" {
  description = "Accès au serveur Docker"
  type = object({
    host             = string
    port_ssh          = string
    private_key_file = string
  })
  sensitive = true
}

variable "docker_container_prefix" {
  type = string
}

variable "db_rentahouse" {
  type = list(object({
    name          = string
    external_port = number
  }))
  description = "Nom et port externe des bases de données"
}

variable "database_config" {
  type = object({
    root_password = string
    user_login    = string
    user_password = string
  })
  description = "Information db"
  sensitive   = true
}
