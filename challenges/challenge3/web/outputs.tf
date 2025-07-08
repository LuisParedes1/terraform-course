# output of web server elastic IP address
output "webServerEIP" {
  value = module.elastic_ip.public_ip
}
