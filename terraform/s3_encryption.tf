# S3 Bucket Server-Side Encryption Configuration
# Enables AES-256 encryption for all objects in the bucket

resource "aws_s3_bucket_server_side_encryption_configuration" "pavlo_ait_feature3" {
  count  = var.enable_server_side_encryption ? 1 : 0
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}