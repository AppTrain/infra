variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "bastion_security_group_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instances" {
  # list of instance names
  type = list(string)
}

variable "instance_type" {
  default = "m5.xlarge"
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
