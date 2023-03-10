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
}
