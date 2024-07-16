
# Voir https://spacelift.io/blog/terraform-aws-vpc

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"

  region         = var.region
  vpc_cidr       = var.vpc_cidr
  private_subnet = var.private_subnet
  public_subnet  = var.public_subnet
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.subnet_public_ids
  security_group_id = module.vpc.ec2_security_group_id
  instance_name = var.instance_name
  instance_type = var.ec2_instance_type
  key_pair_file = var.key_pair_file
  key_pair_name = var.key_pair_name
}

module "rds" {
  source = "./modules/rds"

  instance_type = var.db_instance_type
  private_subnet_ids = module.vpc.subnet_private_ids
  db_security_group_id = module.vpc.db_security_group_id
  db_name     = var.db_name
  db_password = var.db_password
  db_user     = var.db_user
}