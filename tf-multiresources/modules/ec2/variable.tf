
variable "instance-name" {
  description = "name of all instances"
  type = list(string)
}

variable "subnet-id" {
    description = "subnet id for all instances"
    type = list(string)
  
}