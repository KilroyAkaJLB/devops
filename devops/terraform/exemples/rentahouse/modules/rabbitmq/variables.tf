
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
