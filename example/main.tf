locals {
  SQS_name = "sqs-${var.SQS_name.environment}-${var.SQS_name.region}"

  tags = {
    Name            = local.SQS_name
    Description     = var.tag_Description
    Environment     = var.tag_Environment
    Project         = var.tag_Project
    Owner           = var.tag_Owner
    BusinessUnit    = var.tag_BusinessUnit
    OpCo            = var.tag_OpCo
    Confidentiality = var.tag_Confidentiality
    ServiceLevel    = var.tag_ServiceLevel
    SecurityOwner   = var.tag_SecurityOwner
    TechnicalOwner  = var.tag_TechnicalOwner
    Source          = var.tag_Source



  }
}

data "aws_caller_identity" "current" {}

module "SQS" {
  source = "../modules/SQS"

  name              = local.SQS_name
  kms_master_key_id = "alias/aws/sqs"
  policy = [
    {
      effect     = "Allow"
      actions    = ["SQS:SendMessage", "SQS:ReceiveMessage"]
      principals = ["arn:aws:iam::xxxxxxxxx:root"]
    }
    ,
    {
      effect     = "Allow"
      actions    = ["SQS:ReceiveMessage"]
      principals = ["arn:aws:iam::xxxxxxxxx:user/menna"]


    }
  ]
  tags = local.tags
}
