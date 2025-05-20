terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  vpc-cidr = var.vpc-cidr
}

module "subnet" {
  source = "./modules/subnets"
  vpc-id = module.vpc.vpc-id
  subnet-cidr = var.subnet-cidr
}

module "instance" {
  source = "./modules/ec2"
  instance-name = var.instance-name
  subnet-id = module.subnet.subnet_id
}
