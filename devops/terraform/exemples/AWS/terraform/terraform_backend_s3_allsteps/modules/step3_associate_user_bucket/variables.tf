
variable "aws_username" {
  type = string
  description = "Terraform username"
}

variable "aws_bucket_arn" {
  type = string
  description = "ARN du bucket associé"
}

variable "key_path" {
  type = string
  description = "Path associé au terraform state"
}

variable "kms_key_id" {
  type = string
  description = "Id de la clé KMS"
}