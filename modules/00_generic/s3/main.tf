data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_kms_key" "some_key" {
  key_id = var.key_id == "" ? "arn:aws:kms:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:alias/${var.kms_key}" : var.key_id
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = var.bucket_name
  acl = "private"
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = data.aws_kms_key.some_key.arn
        sse_algorithm = "aws:kms"
      }
    }
  }

  lifecycle_rule {
    enabled = var.enable_lifecycle
    expiration {
      days = var.enable_lifecycle ? var.expire_after_days : null
    }
  }

}

resource "aws_s3_bucket_public_access_block" "s3Bucket" {
  bucket = aws_s3_bucket.s3Bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

output "id" {
  description = "Bucket ID"
  value = aws_s3_bucket.s3Bucket.id
}
output "bucket" {
  description = "Bucket Name"
  value = aws_s3_bucket.s3Bucket.bucket
}
output "bucket_arn" {
  description = "Bucket ARN"
  value = aws_s3_bucket.s3Bucket.arn
}

output "bucket_domain_name" {
  description = "Bucket Domain Name"
  value = aws_s3_bucket.s3Bucket.bucket_domain_name
}