terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

variable "aws_region" {
  description = "AWS region where the S3 bucket will be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}

resource "aws_s3_bucket" "this" {
  bucket = "my_bucket1234"
  tags = {
    Name        = "my_bucket1234"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

output "bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "Created S3 bucket ARN"
  value       = aws_s3_bucket.this.arn
}