
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

module "aws_s3_bucket" {
  source = "./modules/step1_aws_s3_bucket"
  aws_bucket_name = var.aws_bucket_name
}

module "aws_user" {
  source = "./modules/step2_aws_user"
  aws_terraform_username = var.aws_terraform_username
}

module "aws_user_bucket" {
  source = "./modules/step3_associate_user_bucket"
  aws_username   = module.aws_user.terraform_username
  aws_bucket_arn = module.aws_s3_bucket.bucket_arn
  key_path       = var.terraform_key_path
  kms_key_id     = module.aws_s3_bucket.kms_key_id
}
