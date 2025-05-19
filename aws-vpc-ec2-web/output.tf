output "instance-public-ip" {
    description = "instance public ip shous"
  value = aws_instance.aman-vpc-server.public_ip
}

# output "instance-public-dns" {
#   value = aws_instance.aman-vpc-server.public_dns
# }

output "instance-url" {
  value = "http://${aws_instance.aman-vpc-server.public_ip}"
}