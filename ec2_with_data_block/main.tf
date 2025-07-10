provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"

  tags = {
    Name = "Web Server"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"

  depends_on = [aws_instance.db]

  tags = {
    Name = "DB Server"
  }
}

data "aws_instance" "db_search" {
  filter {
    name   = "tag:Name"    # key
    values = ["DB Server"] # values
  }
}

output "db_servers" {
  value = data.aws_instance.db_search.availability_zone
}
