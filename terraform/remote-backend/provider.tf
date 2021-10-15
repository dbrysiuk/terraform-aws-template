terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 1.0.8"
}

provider "aws" {
  region = "eu-central-1"
  profile = "test"
  assume_role {
    //  Role that can set up DEPLOY environment for this project
    role_arn = "arn:aws:iam::x:role/x"
  }
}