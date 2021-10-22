resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/${var.project_prefix}-${var.name}-${var.env}-${random_string.random.result}"
  retention_in_days = var.retention_period
  kms_key_id = var.kms_key_id == "NOTSET" ? null : var.kms_key_id

  tags = {
    Component = var.project_prefix
  }
}

output "log_group" {
  value = aws_cloudwatch_log_group.log_group
}