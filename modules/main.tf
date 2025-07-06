provider "aws" {
  region = "us-east-1"
}

# Old version
# module "ec2" {
#   source = "./ec2"
#   count  = 3
# }


module "ec2" {
  source   = "./ec2"
  for_each = toset(["prod", "dev", "stage"])
}

