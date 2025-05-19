terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}


resource "random_id" "bucket-id" {
  byte_length = 5
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "aws_s3_bucket" "name" {
  bucket = "terraform-backend-${random_id.bucket-id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.name.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
