# DB server EC2 instance
resource "aws_instance" "dbServer" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = len(var.server_names)

  tags = {
    Name = var.server_names[count.index]
  }
}
