provider "aws" {
  region = "us-east-1"
}

# Old version
# module "ec2" {
#   source = "./ec2"
#   count  = 3
# }


module "ec2_module" {
  source   = "./ec2" # Everything inside ./ec2 folder is our module
  for_each = toset(["prod", "dev", "stage"])
  name     = "my EC2 instance" # Required attribute
  type     = "t2.micro"        # Optional attribute
}

