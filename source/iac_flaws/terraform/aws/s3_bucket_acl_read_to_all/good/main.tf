resource "aws_s3_bucket" "good_0" {
  bucket = "good_0"
  acl    = "private" # deprecated, but OK
}

resource "aws_s3_bucket" "good_1" {
  bucket = "good_1"
}

resource "aws_s3_bucket_acl" "example_bucket_acl_good" {
  bucket = aws_s3_bucket.good_1.id
  acl    = "private"
}
