variable "vpc-cidr" {
  type = string
  description = "the cidr value of the vpc"
}

variable "subnet-cidr" {
  type = list(string)
}


variable "instance-name" {
  description = "name of all instances"
  type = list(string)
}