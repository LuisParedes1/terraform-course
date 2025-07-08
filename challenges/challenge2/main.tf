provider "aws" {
  region = "us-east-1"
}

/* --------------------------------------------------- */

# DB server EC2 instance
resource "aws_instance" "dbServer" {
  ami           = "ami-068990796e29243d5"
  instance_type = "t2.micro"

  tags = {
    Name = "dbServer"
  }
}

# output of DB server private IP
output "dbServerPrivateIP" {
  value = aws_instance.dbServer.private_ip
}

/* --------------------------------------------------- */

# Web server EC2 instance
resource "aws_instance" "webServer" {
  ami             = "ami-068990796e29243d5"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]

  tags = {
    Name = "webServer"
  }

  # bootstrap process
  user_data = <<EOF
    #!/bin/bash
    sudo yum update
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF

  /* We can also read directly from a file
  user_data = file("filename")
  */
}

# Elastic IP address for Web server EC2 instance
resource "aws_eip" "web_ip" {
  instance = aws_instance.webServer.id
}

# output of web server elastic IP address
output "webServerEIP" {
  value = aws_eip.web_ip.public_ip
}

variable "ingress" {
  type    = list(number)
  default = [80, 443]
}


variable "egress" {
  type    = list(number)
  default = [80, 443]
}

# Web server security group with inbound rules for opening port 80 (HTTP) and port 443 (HTTPS)
resource "aws_security_group" "web_traffic" {
  name = "opening ports"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
