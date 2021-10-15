data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

variable "name" {}
variable "project_prefix" {}
variable "env" {}