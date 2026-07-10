resource "aws_s3_bucket" "website_bucket" {
  bucket = "arr-bucket-fathi-2026"

  tags = {
    Name = "ARR Website Bucket"
  }
}