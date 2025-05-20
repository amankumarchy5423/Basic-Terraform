variable "vpc-cidr" {
  type = string
  description = "the cidr value of the vpc"
}

variable "subnet-cidr" {
  type = list(string)
}