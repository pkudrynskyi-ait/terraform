variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "pavlo-ait-feature4"
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default = {
    Environment = "development"
    ManagedBy   = "terraform"
    Project     = "poc"
  }
}