module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  bucket = "pavlo-ait-feature2"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  tags = {
    Environment = "development"
    ManagedBy   = "terraform"
    Project     = "poc"
  }
}
