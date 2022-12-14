resource "aws_glue_security_configuration" "fail" {
  name = "example"

  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = "DISABLED" // FLAW
    }

    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = "DISABLED" // FLAW
    }

    s3_encryption {
      kms_key_arn        = data.aws_kms_key.example.arn
      s3_encryption_mode = "SSE-KMS"
    }
  }
}