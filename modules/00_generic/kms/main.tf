resource "aws_kms_alias" "alias" {
  name          = "alias/${var.project_prefix}-${var.name}-${var.env}-${random_string.random.result}"
  target_key_id = aws_kms_key.key.key_id
}

resource "aws_kms_key" "key" {
  enable_key_rotation = true
  description         = "KMS Key to encrypt S3 objects "
  policy              = data.aws_iam_policy_document.kms_use.json

}

data "aws_iam_policy_document" "kms_use" {
  statement {
    sid    = "Allow root user of account all permissions"
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type        = "AWS"
    }
  }

  statement {
    sid    = "Allow KMS Use by logs"
    effect = "Allow"
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
      type        = "Service"
    }
  }
}

output "kms_key" {
  value = aws_kms_key.key
}
output "kms_arn" {
  value = aws_kms_key.key.arn
}