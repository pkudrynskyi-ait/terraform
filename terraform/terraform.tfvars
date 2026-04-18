# Terraform Variable Values
# Configuration for pavlo-ait-feature3 S3 bucket

aws_region   = "eu-west-1"
bucket_name  = "pavlo-ait-feature3"
environment  = "feature3"
project_name = "pavlo-ait"

# Security configurations
enable_versioning              = true
enable_server_side_encryption  = true
enable_public_access_block     = true