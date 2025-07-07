provider "aws" {
  region = "sa-east-1"
}

variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]

}

variable "egress_rules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_instance" "web" {
  ami             = "ami-068990796e29243d5"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  # inbound rules - Only accept connections on ports range
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules # [80, 443]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  # outbound rules - Respond though ports range
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules # [80, 443, 25, 3306, 53, 8080]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


}
