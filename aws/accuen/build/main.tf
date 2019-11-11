terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "ops_build_v2.state"
    region = "us-west-2"
  }
}

locals {
  env = "build_ops_v2"
}


# provider "aws" {
#   region = "us-west-2"
#   version = "2.15"
# }

resource "aws_key_pair" "builder" {
  key_name   = "annalect_${local.env}_builder_v2"
  public_key = "${file("${pathexpand("~/.annalect/ssh/builder.pub")}")}"
}


#build_ops


module "buildkite_env" {
  #source = "git@github.com:accuenmedia/buildenv.git//terraform"
  source = "../../../../buildenv/terraform"
  #user      = "jeremiah"
  env           = "${local.env}"
  instance_type = "m5.xlarge"
  ssh_key_pair  = "${aws_key_pair.builder.key_name}"
}
