resource "aws_sqs_queue" "my_queue_pass" {
  name = "terraform-example-queue"
  kms_master_key_id = "alias/aws/sqs"
  kms_data_key_reuse_period_seconds = 300
}

resource "aws_sqs_queue" "my_queue_pass2" {
  name = "terraform-example-queue"
  sqs_managed_sse_enabled = true
}