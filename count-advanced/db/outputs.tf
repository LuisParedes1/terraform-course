# output of DB server private IP
output "dbServerPrivateIP" {
  value = aws_instance.dbServer.*.private_ip
}
