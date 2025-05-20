
variable "vpc-id" {
    description = "value of vpc-id"
  type = string
}

variable "subnet-cidr" {
  type = list(string)
}