terraform {}

locals {
  value = "Hello, World!"
}

variable "lis-string" {
  type = list(string)
  default = [ "value1" , "value2" , "value3" ]
}

output "lower-val" {
#   value = lower(local.value)
#   value = upper(local.value)
  value = startswith(local.value,"Hello")
}