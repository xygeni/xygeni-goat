resource "aws_glue_security_configuration" "pass" {
  name = "example"

  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = "SSE-KMS" // FIXED
      kms_key_arn        = aws_kms_key.example.arn
    }

    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = "CSE-KMS" // FIXED
      kms_key_arn        = aws_kms_key.example.arn
    }

    s3_encryption {
      kms_key_arn        = aws_kms_key.example.arn
      s3_encryption_mode = "SSE-KMS"
    }
  }
}