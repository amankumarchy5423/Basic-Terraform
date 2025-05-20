terraform {
  
}

# List of number type
variable "lis-num" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

# List of object type in terraform
variable "lis-obj" {
    type = list(object({
      fname = string
      lname = string
    }))

    default = [ {
      fname = "aman"
      lname = "kumar"
    } ,
    {
        fname = "aryan"
        lname = "raj"
    }]
}

variable "map-num" {
  type = map(number)
  default = {
    "zero" = 0
    "one" = 1
    "two" = 2

  }
}


# Calculation
locals {
  sum = 2+8
  product = 5*6

}

