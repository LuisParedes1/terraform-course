provider "aws" {
  region = "us-east-1"
}

module "db" {
  source        = "./db"
  ami_id        = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
}

module "web" {
  source        = "./web"
  ami_id        = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
}

output "db_server_privateIP" {
  value = module.db.dbServerPrivateIP
}

output "web_server_EIP" {
  value = module.web.webServerEIP
}
