output "cloud_watch_event_name" {
  value = aws_cloudwatch_log_group.find_users_to_refresh.name
  
}

output "lambda_find_users_to_refresh_name" {
  value = aws_lambda_function.find_users_to_refresh.function_name
}

output "ses_iam_key_ses_mail_id" {
  value = aws_ses_email_identity.iam_key_ses_mail_id.email 
}

output "lambda_update_iam_credentials_for_user_arn" {
  description = "The Lambda ARN of Update IAM credentials lambda"
  value       = aws_lambda_function.update_iam_credentials_for_user.arn
}

output "lambda_find_users_to_refresh_arn" {
  description = "The Lambda ARN of Find users to update IAM credentials lambda"
  value       = aws_lambda_function.find_users_to_refresh.arn
}

output "sns_iam_rotate_credentials_result_arn" {
  description = "The SNS result ARN of topic for result IAM rotate Credential lambdas execution"
  value       = aws_sns_topic.iam_rotate_credentials_result.arn
}

output "sqs_update_iam_credentials_for_user_arn" {
  description = "The ARN of SQS request IAM users credentials"
  value       = aws_sqs_queue.update_iam_credentials_for_user.arn
}

output "sqs_update_iam_credentials_for_user_dead_letter_arn" {
  description = "The ARN of SQS request IAM users credentials ( dead letter )"
  value       = aws_sqs_queue.update_iam_credentials_for_user_dead_letter.arn
}

output "sqs_update_iam_credentials_for_user_id" {
  description = "The URL of SQS request IAM users credentials"
  value       = aws_sqs_queue.update_iam_credentials_for_user.arn
}

output "sqs_update_iam_credentials_for_user_dead_letter_id" {
  description = "The URL of SQS request IAM users credentials ( dead letter )"
  value       = aws_sqs_queue.update_iam_credentials_for_user_dead_letter.id
}

