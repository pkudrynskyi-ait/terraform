resource "aws_s3_bucket" "pavlo_ait_feature3" {
  bucket = "pavlo-ait-feature3"

  tags = {
    Name        = "pavlo-ait-feature3"
    Environment = var.environment
    Project     = "pavlo-ait"
  }
}

resource "aws_s3_bucket_versioning" "pavlo_ait_feature3" {
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pavlo_ait_feature3" {
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "pavlo_ait_feature3" {
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}