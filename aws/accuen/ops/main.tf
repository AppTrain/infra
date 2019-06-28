terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "ops.state"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
  version = "2.15"
}

variable env {
  description = "environment name"
  default     = "ops"
}

variable annalect_access_ips {
  description = "list of IP addresses to access bastion from qubole"
  default = [
    "104.174.30.104/32",
    "99.181.60.75/32",
    "108.193.156.146/32",
    "64.132.248.102/32",
    "71.143.194.189/32",
    "157.131.101.48/32",
    "104.129.204.70/32",
    "76.14.116.12/32",
    "12.154.43.233/32",
    "73.42.71.80/32",
    "104.129.196.81/32",
    "104.136.141.97/32", # jeremiah office
  ]
}