provider "aws" {
  region = "sa-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-068990796e29243d5"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
