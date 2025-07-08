module "elastic_ip" {
  source      = "./elastic_ip"
  instance_id = aws_instance.webServer.id
}

module "security_group" {
  source = "./security_group"
}

# Web server EC2 instance
resource "aws_instance" "webServer" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [module.security_group.name]

  tags = {
    Name = var.web_server_name
  }

  # bootstrap process
  user_data = file("./web/server-script.sh")
}
