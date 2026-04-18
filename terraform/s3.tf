# S3 Bucket Resource
# Creates the main S3 bucket for pavlo-ait-feature3

resource "aws_s3_bucket" "pavlo_ait_feature3" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

# S3 Bucket Ownership Controls
# Ensures proper ownership and ACL configuration
resource "aws_s3_bucket_ownership_controls" "pavlo_ait_feature3" {
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}