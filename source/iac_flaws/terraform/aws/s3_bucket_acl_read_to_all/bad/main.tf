resource "aws_s3_bucket" "bad_0" {
  bucket = "bad_0"
  acl    = "public-read-write" # deprecated, too permissive
}


resource "aws_s3_bucket" "website" {
  bucket = "website"
}

resource "aws_s3_bucket_acl" "website_acl" {
  bucket = aws_s3_bucket.website.id
  acl    = "website" # FLAW
}
