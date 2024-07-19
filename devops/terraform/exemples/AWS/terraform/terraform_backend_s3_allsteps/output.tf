

output "bucket_id" {
  description = "The name of the bucket"
  value       = module.aws_s3_bucket.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = module.aws_s3_bucket.bucket_arn
}


## The access key is sensitive and should be kept secure.
output "terraform_user_access_key" {
  value       = module.aws_user.terraform_user_access_key
  description = "IAM user access key"
  sensitive   = true
}

output "terraform_user_secret_key" {
  value       = module.aws_user.terraform_user_secret_key
  description = "IAM user secret key"
  sensitive   = true
}
