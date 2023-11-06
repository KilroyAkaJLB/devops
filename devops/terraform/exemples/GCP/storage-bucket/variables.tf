variable "project" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-c"
}


variable "namespace"{
  type = string
  description = "Default namespace"
  default = "rentahouse"
}

variable "bucket-name"{
  type = string
  description = "Name of bucket"
}
