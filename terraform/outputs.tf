# Terraform Outputs
# Exports important S3 bucket properties

output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.pavlo_ait_feature3.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.pavlo_ait_feature3.arn
}

output "bucket_region" {
  description = "The region of the S3 bucket"
  value       = var.aws_region
}

output "bucket_domain_name" {
  description = "The bucket region-specific domain name"
  value       = aws_s3_bucket.pavlo_ait_feature3.bucket_regional_domain_name
}

output "versioning_enabled" {
  description = "Whether versioning is enabled on the bucket"
  value       = var.enable_versioning
}

output "encryption_enabled" {
  description = "Whether server-side encryption is enabled"
  value       = var.enable_server_side_encryption
}

output "public_access_blocked" {
  description = "Whether public access is blocked"
  value       = var.enable_public_access_block
}