# Terraform Variables
# Defines all input variables for S3 bucket configuration

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be lowercase alphanumeric with hyphens."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "feature3"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "pavlo-ait"
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "enable_server_side_encryption" {
  description = "Enable server-side encryption for the bucket"
  type        = bool
  default     = true
}

variable "enable_public_access_block" {
  description = "Enable public access block for the bucket"
  type        = bool
  default     = true
}