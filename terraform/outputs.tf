output "pavlo_ait_feature3_bucket_name" {
  description = "Name of the pavlo-ait-feature3 S3 bucket"
  value       = aws_s3_bucket.pavlo_ait_feature3.id
}

output "pavlo_ait_feature3_bucket_arn" {
  description = "ARN of the pavlo-ait-feature3 S3 bucket"
  value       = aws_s3_bucket.pavlo_ait_feature3.arn
}

output "pavlo_ait_feature3_bucket_region" {
  description = "Region of the pavlo-ait-feature3 S3 bucket"
  value       = aws_s3_bucket.pavlo_ait_feature3.region
}