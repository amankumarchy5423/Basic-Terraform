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

resource "aws_vpc" "aman-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "aman-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.aman-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.aman-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "aman-vpc-ig" {
  vpc_id = aws_vpc.aman-vpc.id

  tags = {
    Name = "aman-vpc-ig"
  }
}

resource "aws_route_table" "aman-vpc-rt" {
  vpc_id = aws_vpc.aman-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aman-vpc-ig.id
  }

  tags = {
    Name = "aman-vpc-rt"
  }
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.aman-vpc-rt.id
}

resource "aws_instance" "aman-vpc-instance" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id

  tags = {
    Name = "aman-vpc-instance"
  }
}
