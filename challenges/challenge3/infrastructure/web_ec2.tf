variable "web_server_name" {
  type    = string
  default = "webServer"
}

# Web server EC2 instance
resource "aws_instance" "webServer" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_traffic.name]

  tags = {
    Name = var.web_server_name
  }

  # bootstrap process
  user_data = file("./infrastructure/server-script.sh")
}

# Elastic IP address for Web server EC2 instance
resource "aws_eip" "web_eip" {
  instance = aws_instance.webServer.id
}

