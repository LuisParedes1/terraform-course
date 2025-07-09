provider "aws" {
  region = "us-east-1"
}

module "db" {
  source        = "./db"
  ami_id        = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  server_names  = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.dbServerPrivateIP
}
