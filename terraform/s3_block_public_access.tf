# S3 Bucket Public Access Block Configuration
# Blocks all public access to the bucket and its objects

resource "aws_s3_bucket_public_access_block" "pavlo_ait_feature3" {
  count  = var.enable_public_access_block ? 1 : 0
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}