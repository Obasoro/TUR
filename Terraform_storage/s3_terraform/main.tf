provider "aws" {
  region = "us-east-1"
}

# Create s3-bucket backend
resource "aws_s3_bucket" "terraform_state_1" {
  bucket = "kunle-storage-tur"

  lifecycle {
    prevent_destroy = false
  }

}

# Create a s3 versioning resource

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state_1.id
  versioning_configuration {
    status = "Enabled"
  }

}

# Create and s3 encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state_1.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

}

# Bloc all public acccess to s3_bucket

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state_1.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

# Use dynamodb for locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "kunle-tur"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

# Storing tour information in remote backend

# Always create your s3 bucket first become adding the remote backend


 terraform {
   backend "s3" {
#     bucket = "kunle-storage-tur"
#     dynamodb_table = "kunle-tur"
#     region = "us-east-1"
#     encrypt = true
     key    = "webserver/terraform.tfstate"

  }
 }