# FLAW

resource "aws_ecr_repository" "bad" {
  name = "my_repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false # FLAW
  }
}

resource "aws_ecr_repository" "bad2" { # FLAW
  name = "my_repo"
  image_tag_mutability = "MUTABLE"

  # ...
}
