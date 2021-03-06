terraform {
  required_version = "1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.1"
    }
  }
  backend "s3" {}
}
