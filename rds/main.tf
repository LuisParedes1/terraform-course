provider "aws" {
  region = "us-east-1"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
# It's useful to see in the console UI the required parameters and different options available when creating an RDS instance
resource "aws_db_instance" "myRDS" {
  db_name             = "myDB"
  identifier          = "my-first-rds"
  instance_class      = "db.t4g.micro"
  engine              = "mariadb"
  engine_version      = "11.4.5"
  username            = "bob"
  password            = "password123"
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}
