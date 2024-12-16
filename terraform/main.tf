terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.pat_token
  secret_key = var.pat_secret
}
