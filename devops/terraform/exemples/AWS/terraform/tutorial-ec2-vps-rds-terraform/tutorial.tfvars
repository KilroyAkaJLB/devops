
region = "eu-north-1"

##############
# VPC
#
vpc_cidr = "10.0.0.0/16"

public_subnet = [
  { cidr_block="10.0.1.0/24", "availability_zone" = "eu-north-1a", "name"="10-1" },
  { cidr_block="10.0.2.0/24", "availability_zone" = "eu-north-1b", "name"="10-2" },
  { cidr_block="10.0.3.0/24", "availability_zone" = "eu-north-1c", "name"="10-3" },
]

private_subnet = [
  { cidr_block="10.0.11.0/24", "availability_zone" = "eu-north-1a", "name"="10-11" },
  { cidr_block="10.0.12.0/24", "availability_zone" = "eu-north-1b", "name"="10-12" },
  { cidr_block="10.0.13.0/24", "availability_zone" = "eu-north-1c", "name"="10-13" },
]

##############
# EC2
#
# Debian 12 (HVM), SSD Volume Type
ami_id = "ami-0506d6d51f1916a96"
instance_name = "Web server terraform test"
ec2_instance_type = "t3.micro"

key_pair_name = "debian_1"
key_pair_file = "/Users/adminjlb/Documents/DevOps/aws/keys/awsec2.pub"

##############
# RDS
#
db_instance_type = "db.t3.micro"
db_name = "tutorial_ec2"
db_user = "admin"
db_password = "abcd4ABCD"
