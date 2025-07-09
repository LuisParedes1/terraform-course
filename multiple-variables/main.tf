provider "aws" {
  region = "us-east-1"
}

variable "number_servers" {
  type = number

}

resource "aws_instance" "db" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  count         = var.number_servers
}
