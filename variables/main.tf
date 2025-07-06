provider "aws" {
  region = "us-east-1"
}


variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "shhport" {
  type    = number
  default = 22
}

variable "enabled" {
  type    = bool
  default = true
}



variable "my_list" {
  type    = list(string)
  default = ["value1", "value2"]
}

variable "my_map" {
  type = map(string)
  default = {
    Key1 = "value1"
    Key2 = "value2"
  }
}


variable "my_set" {
  type    = set(string)
  default = ["red", "green", "blue"]
}

variable "my_tuple" {
  type    = tuple([string, number, bool])
  default = ["John", 42, true]
}

variable "my_object" {
  type = object({
    id      = string
    enabled = bool
    tags    = map(string)
  })
  default = {
    id      = "obj-123"
    enabled = true
    tags = {
      environment = "dev"
      team        = "ops"
    }
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpcname
  }
}

output "myoutput" {
  value = aws_vpc.myvpc.id
}
