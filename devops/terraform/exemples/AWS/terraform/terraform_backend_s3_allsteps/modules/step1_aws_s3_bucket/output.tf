
output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.terraform-state.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.terraform-state.arn
}

output "kms_key_id" {
  description = "Id de la clé KMS"
  value       = aws_kms_key.terraform-bucket-key.id
}