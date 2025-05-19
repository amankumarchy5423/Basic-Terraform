resource "aws_security_group" "aman-sg" {
  vpc_id = aws_vpc.aman-vpc.id

#   inbound_rules
 ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

 }

# outbound rules
 egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]

 }

 tags = {
   Name = "aman-sg"
 }
}