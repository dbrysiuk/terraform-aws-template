resource "aws_iam_policy" "policy" {
  name = "${var.project_prefix}-${var.name}-${var.env}-${random_string.random.result}"
  path = "/"
  policy = var.assume_policy

  tags = {
    Component = var.project_prefix
  }

}

output "policy" {
  value = aws_iam_policy.policy
}