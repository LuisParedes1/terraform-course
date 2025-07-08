# output of DB server private IP
output "dbServerPrivateIP" {
  value = aws_instance.dbServer.private_ip
}

# output of web server elastic IP address
output "webServerEIP" {
  value = aws_eip.web_eip.public_ip
}
