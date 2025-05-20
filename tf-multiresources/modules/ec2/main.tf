
resource "aws_instance" "aman-ec2" {
    count = length(var.instance-name)
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t3.micro"
  subnet_id = element(var.subnet-id[*] , count.index % 2)

  tags = {
    Name = var.instance-name[count.index]
  }

}