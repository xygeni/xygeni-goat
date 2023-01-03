# fail

data "aws_iam_policy_document" "fail" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "no_effect" {
  version = "2012-10-17"

  statement {
    actions = [
      "*"
    ]
    resources = [
      "*",
    ]
  }
}

# unknown

