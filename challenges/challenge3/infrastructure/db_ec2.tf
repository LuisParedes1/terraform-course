variable "db_server_name" {
  type    = string
  default = "dbServer"
}

# DB server EC2 instance
resource "aws_instance" "dbServer" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.db_server_name
  }
}
