terraform {
  required_version = "= 1.13.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.52.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "= 4.0.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "= 3.5.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "= 2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "= 3.2.2"
    }
  }
}

provider "aws" {
  region = var.aws.region
}
