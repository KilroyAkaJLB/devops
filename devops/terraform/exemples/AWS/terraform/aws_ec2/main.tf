
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "aws_instance" {
  source = "./modules/aws_ec2"
  instance_name = var.instance_name
  instance_type = var.instance_type
  key_pair_name = var.key_pair_name
  key_pair_file = var.key_pair_file
}
