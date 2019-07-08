terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "ops_django_clone.state"
    region = "us-west-2"
  }
}

# provider "aws" {
#   region = "us-west-2"
#   version = "2.15"
# }

resource "aws_key_pair" "packer_smp" {
  key_name   = "annalect-${var.env}-pakcer-smp"
  public_key = "${file("${pathexpand("~/.annalect/ssh/packer_smp.pub")}")}"
}

variable "env"{
  default = "build-ops-django-clone"
}