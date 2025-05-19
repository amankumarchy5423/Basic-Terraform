terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

data "aws_security_group" "name" {
  tags = {
    "port" = "8080"
  }
}

output "aws_ami" {
  value = data.aws_security_group.name
}

data "aws_vpc" "name" {
  tags = {
    "Name" = "aman-vpc"
  }
}
output "vpc" {
  value = data.aws_vpc.name.id
}

data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_instance" "my-instance" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  security_groups = [data.aws_security_group.name.id]
  subnet_id = data.aws_subnet.name.id


  tags = {
    Name = "my-instance"
  }

}