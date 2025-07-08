variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "db_server_name" {
  type    = string
  default = "dbServer"
}
