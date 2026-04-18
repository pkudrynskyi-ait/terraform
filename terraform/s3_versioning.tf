# S3 Bucket Versioning Configuration
# Enables versioning to maintain multiple versions of objects

resource "aws_s3_bucket_versioning" "pavlo_ait_feature3" {
  bucket = aws_s3_bucket.pavlo_ait_feature3.id

  versioning_configuration {
    status     = var.enable_versioning ? "Enabled" : "Suspended"
    mfa_delete = "Disabled"
  }
}