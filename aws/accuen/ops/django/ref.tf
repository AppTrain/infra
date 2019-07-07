data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["accuen-build-ops-vpc"]
  }
}
data "aws_security_group" "bastion" {
  filter {
    name   = "tag:Name"
    values = ["annalect-bastion-build-ops"]
  }
}

data "aws_security_group" "builder" {
  filter {
    name   = "tag:Name"
    values = ["annalect-buildenv-build-ops"]
  }
}

data "aws_subnet" "west_2a" {
  filter {
    name   = "tag:Name"
    values = ["accuen-build-ops-vpc-private-us-west-2a"]
  }
}
data "aws_subnet" "west_2b" {
  filter {
    name   = "tag:Name"
    values = ["accuen-build-ops-vpc-private-us-west-2b"]
  }
}

data "aws_subnet" "west_2b_public" {
  filter {
    name   = "tag:Name"
    values = ["accuen-build-ops-vpc-public-us-west-2b"]
  }
}