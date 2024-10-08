resource "aws_sqs_queue" "example_queue" {
  name                    = "example-sqs-queue"
  sqs_managed_sse_enabled = true
}