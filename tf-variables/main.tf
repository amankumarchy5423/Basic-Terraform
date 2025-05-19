terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "my-instance" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size = var.root_volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = "my-instance"
  }

}