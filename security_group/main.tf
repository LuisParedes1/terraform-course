provider "aws" {
  region = "sa-east-1"
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

  # inbound rules - Only accept connections on port range [443,443]
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }

  # outbound rules - Respond though port range [443,443]
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
