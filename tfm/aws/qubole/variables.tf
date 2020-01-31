variable "env" {
  description = "environment name"
}

variable "root_zone" {
  description = "dns root zone dns name"
}

variable "vpc_cidr" {
  description = "cidr address space for vpc"
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "aws availability zones within a vpc"
  type        = list(string)

  default = [
    "us-west-2a",
    "us-west-2b",
  ]
}

resource "aws_key_pair" "qubole_account" {
  key_name   = "${var.env}-qubole"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCh9Op7bZRLYUBuOuQjRkHdjToWIninu97+aZW3Pug4oups/XgTeNw+Qnhl7xQjKrkc7iAqlAmNiL7Ln7LWFj/BlMFTiHzb8WjZCFf/z+49mZ5U80zoCHvEcAAYntrAqvc6+W3z7gE/dp3knFlEu2Q3RZh7D1uxXDb3WxVQyrnTGWeJPzxPYRBjOEMosJI21vv1FG2ze62d/1PCIhH4HOM7OPA+YzlCRSOn27Icu2vbo7x26n17MxlYnjOgKBC7JpzktOc88tclrIzUAkKNuckN/HTcUskx9vbm/zriaTcUnVgns+wFc8z/2o9TXHjVXRN8a1iMh/lm4Sd1pZR9wvv/"
}

variable "qubole_access_ips" {
  description = "list of IP addresses to access bastion from qubole"
  default = [
    "54.243.39.255/32",
    "54.204.43.32/32",
    "23.23.178.159/32",
    "52.44.223.209/32",
  ]
}

variable "annalect_access_ips" {
  description = "list of IP addresses to access bastion from qubole"
}
