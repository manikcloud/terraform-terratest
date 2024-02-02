provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_simple_bucket" {
  bucket = "my-simple-unique-bucket-name-12345"
  acl    = "private"

  tags = {
    Name        = "MySimpleS3Bucket"
    Environment = "Dev"
  }
}
