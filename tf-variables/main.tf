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
  instance_type = var.instance_type

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2-config.root_volume_size
    volume_type = var.ec2-config.root_volume_type
  }

  tags = merge(var.additional-tags,{
    Name = "my-instance"
  }
  )

}