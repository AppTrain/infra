terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "ops_build.state"
    region = "us-west-2"
  }
}

# provider "aws" {
#   region = "us-west-2"
#   version = "2.15"
# }

resource "aws_key_pair" "builder" {
  key_name   = "annalect_${var.env}_builder"
  public_key = "${file("${pathexpand("~/.annalect/ssh/builder.pub")}")}"
}