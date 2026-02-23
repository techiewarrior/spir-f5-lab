terraform {
  required_version = ">= 1.1.7"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      # pin to whatever major you’re targeting
      version = ">= 4.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.2"
    }

    bigip = {
      source = "F5Networks/bigip"
      # choose a version that has darwin_arm64 builds
      version = ">= 1.24.0"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
#   shared_credentials_files = ["~/.aws/credentials"]
#   profile                  = "default"
 }
