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

variable "env"{
  default = "build-ops-django-clone"
}