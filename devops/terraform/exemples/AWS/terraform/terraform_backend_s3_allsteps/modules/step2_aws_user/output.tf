
output "terraform_username" {
  value = aws_iam_user.terraform.name
}

## The access key is sensitive and should be kept secure.
output "terraform_user_access_key" {
  value       = aws_iam_access_key.terraform.id
  description = "IAM user access key"
  sensitive   = true
}

output "terraform_user_secret_key" {
  value       = aws_iam_access_key.terraform.secret
  description = "IAM user secret key"
  sensitive   = true
}