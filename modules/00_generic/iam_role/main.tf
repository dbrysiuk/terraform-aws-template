resource "aws_iam_role" "role" {
  name = "${var.project_prefix}-${var.name}-${var.env}-${random_string.random.result}"
  path = "/"
  assume_role_policy = var.assume_role_policy

  tags = {
    Component = var.project_prefix
  }

}

output "role" {
  value = aws_iam_role.role
}