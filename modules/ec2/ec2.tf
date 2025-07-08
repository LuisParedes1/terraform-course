variable "name" {
  type = string
}

variable "type" {
  type    = string
  default = "t2.micro"
}

resource "aws_instance" "ec2" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = var.type

  tags = {
    Name = var.name
  }
}
