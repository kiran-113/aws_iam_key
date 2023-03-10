
terraform {
  required_providers {
    aws = ">= 2.40.0"
  }
}

data "aws_caller_identity" "current" {}

locals {
  service_name                                = "iam-rotate-credentials"
  sqs_name                                    = "update-iam-credentials-for-user"
  sqs_arn                                     = "arn:aws:sqs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${local.sqs_name}"
  sqs_url                                     = "https://sqs.${var.aws_region}.amazonaws.com/${data.aws_caller_identity.current.account_id}/${local.sqs_name}"
  sns_name                                    = "${local.service_name}-result"
  sns_arn                                     = "arn:aws:sns:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${local.sns_name}"
  tags                                        = merge(var.tags, tomap({"Service"="local.service_name"}))
  lambda_find_users_to_refresh_name           = "${local.service_name}-find-users-to-refresh"
  lambda_update_iam_credentials_for_user_name = "${local.service_name}-update-iam-credentials-for-user"
  lambda_prefix_arn                           = "arn:aws:lambda:${var.aws_region}:${data.aws_caller_identity.current.account_id}:function:"
  lambda_find_users_to_refresh_arn            = "${local.lambda_prefix_arn}${local.lambda_find_users_to_refresh_name}"
  lambda_update_iam_credentials_for_user_arn  = "${local.lambda_prefix_arn}${local.lambda_update_iam_credentials_for_user_name}"
}
