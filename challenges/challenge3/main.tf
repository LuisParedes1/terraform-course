provider "aws" {
  region = "us-east-1"
}

module "infrastructure" {
  source        = "./infrastructure"
  ami_id        = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
}

output "db_server_privateIP" {
  value = module.infrastructure.dbServerPrivateIP
}

output "web_server_EIP" {
  value = module.infrastructure.webServerEIP
}
