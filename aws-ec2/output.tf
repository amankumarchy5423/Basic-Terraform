output "instance-public-dns" {
  value = aws_instance.my-instance.public_dns
}

output "instance-public-ip" {
  value = "http://${aws_instance.my-instance.public_ip}"
}
