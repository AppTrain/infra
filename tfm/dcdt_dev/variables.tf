variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "user" {
  type = string
}

variable "github_user" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "m5.xlarge"
}

variable "access_ssh" {
  type = list(string)
}

variable "access_web" {
  type = list(string)
}

variable "zone_id" {
  type = string
}

variable "dns_name" {
  type = string
}

# data "aws_vpc" "selected" {
#   filter {
#     name = "tag:Name"
#     values = ["${var.vpc_name}"]
#   }
# }
# data "aws_security_group" "bastion" {
#   filter {
#     name   = "tag:Name"
#     values = ["${var.bastion_security_group_name}"]
#   }
# }
# data "aws_subnet" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = ["${var.subnet_name}"]
#   }
# }
