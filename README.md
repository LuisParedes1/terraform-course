# Terraform

Terraform is an open-source infrastructure automation tool created by HashiCorp.

It allows you to define and describe your infrastructure as code (IaC) inside configuration files using a declarative language and to deploy and manage that infrastructure across a variety of public cloud providers like AWS, GCP, Azure, etc.

# Terraform Lifecycle

1. `terraform init` to initialize a workspace. Downloads modules and providers
2. `terraform plan` to see what changes Terraform will make (execution plan)
3. `terraform apply` to apply changes
4. `terraform destroy` to destroy a workspace. This has no undo

# Terraform Language

The main purpose of the Terraform language is declaring resources, which represent infrastructure objects.

The syntax of the Terraform language consists of only a few basic elements:

```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

Terraform language [documentation](https://developer.hashicorp.com/terraform/language)

# Terraform config files

Terraform config files from Udemy course [Terraform for AWS - Beginner to Expert](https://www.udemy.com/course/terraform-fast-track/)

# More resources

Terraform [Getting started tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) has great examples as well
