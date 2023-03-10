terraform {
  cloud {
    organization = "stebdev"

    workspaces {
      name = "workspace-default-vpc-rt53-alb-asg-with-lt"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
