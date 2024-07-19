
variable "aws_region" {
  type = string
}

variable "aws_bucket_name" {
  type = string
}

variable "aws_terraform_username" {
  type = string
}
variable "terraform_key_path" {
  type = string
  description = "Key path pour le terraform state"
}