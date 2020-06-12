provider "aws" {
  #access_key = var.AWS_ACCESS_KEY_ID
  #secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = "us-east-1"
}

resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "tf_code" {

  bucket        = "${var.project_name}-${random_id.tf_bucket_id.dec}"
  acl           = "private"
  force_destroy = "true"
  tags = {
    name = "tf_bucket"
  }
}

