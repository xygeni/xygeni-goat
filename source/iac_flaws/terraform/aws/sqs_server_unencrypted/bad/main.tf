# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue
resource "aws_sqs_queue" "my_queue_fail" {
  name = "terraform-example-queue"
}

resource "aws_sqs_queue" "my_queue_fail2" {
  name = "terraform-example-queue"
  kms_master_key_id = ""
}

resource "aws_sqs_queue" "my_queue_fail3" {
  name = "terraform-example-queue"
  sqs_managed_sse_enabled = false
}

resource "aws_sqs_queue" "my_queue_pass" {
  name = "terraform-example-queue"
  kms_master_key_id = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}

resource "aws_sqs_queue" "my_queue_pass2" {
  name = "terraform-example-queue"
  sqs_managed_sse_enabled = true
}