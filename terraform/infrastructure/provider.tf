terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 1.0.8"
  backend "s3" {}
}

provider "aws" {
  profile = var.profile
  region  = var.region

  assume_role {
    role_arn = var.deployment_role_arn
  }

  default_tags {
    tags = {
      Environment       = var.env
      BuildType         = "Terraform - Remote State"
      Terraform-Version = var.tf_version
      Project-Version   = var.project_version
    }
  }
}