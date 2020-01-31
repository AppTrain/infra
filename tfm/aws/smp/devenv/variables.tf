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
  # list of instance names
  type = string
}

variable "instance_type" {
  default = "m5.xlarge"
}

variable "access_ips" {
  type = list(string)
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
