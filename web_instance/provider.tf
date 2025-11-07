terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    alias = "terraform-runner"
    region = "eu-west-1"
    assume_role {
      role_arn = "arn:aws:iam::446949660857:role/terraform-runner"
    }
    endpoints {
      s3 = var.endpoint
    }
}
