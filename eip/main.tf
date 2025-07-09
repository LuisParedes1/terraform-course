provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-068990796e29243d5"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web.id
  domain   = "vpc"
}

output "EIP" {
  value = aws_eip.elastic_ip.public_ip
}
