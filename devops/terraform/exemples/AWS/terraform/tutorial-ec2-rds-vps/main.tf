
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
  nomberof_instance = var.ec2_numberof_instance
  instance_name = var.ec2_instance_name
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


# Export Terraform variable values to an Ansible var_file
resource "local_file" "tf_ansible_vars_file" {
  content = <<-DOC
    # Ansible vars_file containing variable values from Terraform.
    # Generated by Terraform mgmt configuration.

    tf_environment: '${terraform.workspace}'
    tf_instance_public_dns: '${module.ec2.instance_public_dns}'
    tf_database_endpoint: '${module.rds.database_endpoint}'
    tf_db_name: '${var.db_name}'
    tf_db_user: '${var.db_user}'
    tf_db_password: '${var.db_password}'
    DOC
  filename = "../tutorial-ec2-vps-rds-ansible/tasks/aws_vars.yaml"
}