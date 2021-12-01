
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "SQS_Allow_policy" {
  statement {
    sid     = "DenyAllAccess"
    effect  = "Deny"
    actions = ["SQS:SendMessage", "SQS:ReceiveMessage"]
    principals  {
      type="*"
      identifiers=["*"]
    }
     resources = local.arn_name
  }
  dynamic "statement" {
    for_each = var.policy
    content {
      sid     = "Allow_Access_${statement.key}"
      effect  = statement.value.effect
      actions = tolist(statement.value.actions)
      
      principals {
        type        = "AWS"
        identifiers = statement.value.principals
        }
      resources = local.arn_name
  }

  }
}
data "aws_iam_policy_document" "Default_Policy" {
  statement {
    sid     = "Default_Policy"
    effect  = "Allow"
    actions = ["SQS:*"]
    principals  {
      type="AWS"
      identifiers=["${data.aws_caller_identity.current.arn}"]
    }
     resources = local.arn_name
  }
 
}
resource "aws_sqs_queue" "sqs_queue_name" {


  name = var.name

  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  policy                      = length(var.policy) > 0 ? data.aws_iam_policy_document.SQS_Allow_policy.json: data.aws_iam_policy_document.Default_Policy.json
  redrive_policy              = var.redrive_policy
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  deduplication_scope         = var.deduplication_scope
  fifo_throughput_limit       = var.fifo_throughput_limit

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = var.tags
}


