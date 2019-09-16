data "aws_caller_identity" "this" {}

data "aws_ami" "buildenv" {
  most_recent = true

  filter {
    name   = "name"
    values = ["annalect_build_env*"]
  }

  #   filter {
  #     name   = "virtualization-type"
  #     values = ["hvm"]
  #   }

  owners = ["${data.aws_caller_identity.this.account_id}"]
}

data "aws_ami" "ubuntu_1804" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # canonical
}
