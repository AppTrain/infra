data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["accuen-build-ops-vpc"]
  }
}

data "aws_security_group" "bastion" {
  filter {
    name   = "tag:Name"
    values = ["annalect-bastion-build-ops"]
  }
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["accuen-build-ops-vpc-private-us-west-2b"]
  }
}
