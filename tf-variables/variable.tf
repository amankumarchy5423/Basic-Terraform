variable "region" {
  description = "the region where the instance will be created"
  type = string
  # default = "ap-south-1"
}

variable "instance_type" {
  description = "enter the instance type for the ec2 instance"
  type        = string

  validation {
    condition     = var.instance_type != "t2.micro" || var.instance_type != "t2.small"
    error_message = "Instance type must be t2.micro or t2.small."
  }
}

variable "ec2-config" {
  type = object({
    root_volume_size = number
    root_volume_type = string
  })

  # default = {
  #   root_volume_size = 20
  #   root_volume_type = "gp2"
  # }
}


variable "additional-tags" {
  type = map(string)
  # default = {
  #   "name" = "value"
  # }
}