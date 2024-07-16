
# Docker

variable "docker_config" {
  type = object({
    host             = string
    port_ssh         = number
    private_key_file = string
  })
  description = "Accès au serveur Docker"
  sensitive   = true
}

variable "docker_container_prefix" {
  type = string
}

/*variable "db_rentahouse" {
  type = list(object({
    name          = string
    external_port = number
  }))
  description = "Nom et port externe des bases de données"
}*/

variable "database_config" {
  type = object({
    root_password = string
    user_login    = string
    user_password = string
  })
  description = "Information db"
  sensitive   = true
}

# Kubernetes
variable "namespace" {
  type = string
}

variable "wshabitation" {
  type = object({
    image_version    = string
    service_nodeport = number
    mariadb_port     = number
    mariadb_dbname   = string
    profile          = string
  })
}
variable "wslocation" {
  type = object({
    image_version    = string
    service_nodeport = number
    mariadb_port     = number
    mariadb_dbname   = string
    profile          = string
  })
}
variable "wslocuser" {
  type = object({
    image_version    = string
    service_nodeport = number
    mariadb_port     = number
    mariadb_dbname   = string
    profile          = string
  })
}


# RabbitMQ
variable "rabbitmq_server_address" {
  type = string
  sensitive = true
}
variable "rabbitmq_server_user" {
  type = string
  sensitive = true
}
variable "rabbitmq_server_password" {
  type = string
  sensitive = true
}

variable "rabbitmq_vhost_name" {
  type = string
}
