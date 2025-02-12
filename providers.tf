terraform {
  required_version = ">= 0.14"
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.86.1"
    }
  }
}
