
variable "namespace" {
  type = string
}

# Database access
variable "mariadb_config" {
  type = object({
    host     = string
    username = string
    password = string
  })
  sensitive = true
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
