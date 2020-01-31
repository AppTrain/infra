variable "env" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "access_ips" {
  type = list(string)
}

variable "name" {
  type    = string
  default = "bastion"
}
