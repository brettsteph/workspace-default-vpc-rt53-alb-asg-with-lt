terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "stebdev"

    workspaces {
      name = "workspace-default-vpc-rt53-alb-asg-with-lt"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}
