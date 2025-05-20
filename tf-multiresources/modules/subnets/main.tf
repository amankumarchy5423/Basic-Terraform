
resource "aws_subnet" "subnet" {
    count = length(var.subnet-cidr)
  vpc_id = var.vpc-id
  cidr_block = var.subnet-cidr[count.index]
}