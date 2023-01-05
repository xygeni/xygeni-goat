# fail

resource "aws_glue_crawler" "default" {
  database_name = "aws_glue_catalog_database.example.name"
  name          = "example"
  role          = "aws_iam_role.example.arn"
}

resource "aws_glue_dev_endpoint" "default" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"
}

resource "aws_glue_job" "default" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"

  command {
    script_location = "s3://aws_s3_bucket.example.bucket/example.py"
  }
}

resource "aws_glue_security_configuration" "example" {
  name = "example"

  encryption_configuration {
    cloudwatch_encryption {
      cloudwatch_encryption_mode = "DISABLED"
    }

    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = "DISABLED"
    }

    s3_encryption {
      kms_key_arn        = data.aws_kms_key.example.arn
      s3_encryption_mode = "SSE-KMS"
    }
  }
}
