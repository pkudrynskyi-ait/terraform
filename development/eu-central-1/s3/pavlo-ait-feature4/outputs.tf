output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = module.s3_bucket.s3_bucket_id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = module.s3_bucket.s3_bucket_arn
}

output "bucket_region" {
  description = "The AWS region where the S3 bucket is deployed"
  value       = "eu-central-1"
}

output "versioning_enabled" {
  description = "Whether versioning is enabled on the bucket"
  value       = true
}