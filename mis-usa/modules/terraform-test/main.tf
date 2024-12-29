terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-unique-id-sydon"

  tags = {
    Name        = "Test Bucket"
    Environment = "dev"
  }
}

# Manage the bucket ACL separately
resource "aws_s3_bucket_acl" "test_bucket_acl" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "private"
}