terraform {
  backend "s3" {
    bucket     = "bucket-name"
    key        = "terraform/tfstate.tfstate" # path of the statefile
    region     = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}
