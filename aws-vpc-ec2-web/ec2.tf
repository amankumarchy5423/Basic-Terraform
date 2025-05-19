resource "aws_instance" "aman-vpc-server" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.aman-sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "aman-vpc-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker pull amanmlops/stock-price:v3
              docker run -d -p 80:5050 amanmlops/stock-price:v3
              EOF
}