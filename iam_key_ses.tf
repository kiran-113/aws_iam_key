resource "aws_ses_email_identity" "iam_key_ses_mail_id" {
  email = var.iam_key_ses_mail_id
}