resource "aws_s3_bucket" "my_sm_bucket" {
  bucket = "myaraman"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}