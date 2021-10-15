module "ec2_role" {
  source = "../00_generic/iam_role"
  env = var.env
  name = "my-first-ec2"
  project_prefix = var.project_prefix
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_prefix}-ec2-${var.env}"
  role = module.ec2_role.role.name
}

data "aws_iam_policy_document" "ec2_role_policy_document" {

  statement {
    effect    = "Allow"
    actions   = [
      "s3:GetObject"
    ]
    resources = [
      var.s3_arn,
      "${var.s3_arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  policy = data.aws_iam_policy_document.ec2_role_policy_document.json
  role   = module.ec2_role.role.id
}