# Used to create backend of a project, preferred to reside in a tooling account
data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

resource "aws_kms_key" "kms_key_for_remote_states" {
  description = "KMS Key to encrypt terraform remote state S3 buckets"
  policy = data.aws_iam_policy_document.kms_use.json
}

data "aws_iam_policy_document" "kms_use" {
  statement {
    sid = "Allow root user of account all permissions"
    effect = "Allow"
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      type = "AWS"
    }
  }

  statement {
    sid = "Allow KMS Use by logs"
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
      identifiers = [
        "logs.eu-west-1.amazonaws.com"]
      type = "Service"
    }
  }
}

resource "aws_s3_bucket" "terraform-state-backend-bucket" {
  bucket = "${var.project_prefix}-terraform-state-bucket-${random_string.random.result}"
  acl = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kms_key_for_remote_states.arn
        sse_algorithm = "aws:kms"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform-state-lock-table" {
  name = "${var.project_prefix}-terraform-state-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket_public_access_block" "s3Bucket" {
  bucket = aws_s3_bucket.terraform-state-backend-bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}