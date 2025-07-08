# Elastic IP address for Web server EC2 instance
resource "aws_eip" "web_eip" {
  instance = aws_instance.webServer.id
}
