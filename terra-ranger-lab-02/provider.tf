terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  profile = var.my-profile
  region  = var.my-region
  default_tags {
    tags = {
      "Managed_by" = "Terraform"
    }
  }
}