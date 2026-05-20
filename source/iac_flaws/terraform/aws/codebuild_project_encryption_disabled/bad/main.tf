resource "aws_codebuild_project" "fail" {
  name = "fail-project"
  artifacts {
    type                = S3
    encryption_disabled = true
  }

}