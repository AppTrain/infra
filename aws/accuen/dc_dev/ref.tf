

data "aws_vpc" "dev1" {
  filter {
    name   = "tag:Name"
    values = ["dev1-vpc"]
  }
}

data "aws_subnet" "dev1_public_2b" {
  vpc_id = "${data.aws_vpc.dev1.id}"
  filter {
    name   = "tag:Name"
    values = ["dev1-vpc-public-us-west-2b"]
  }
}
data "aws_subnet" "dev1_private_2b" {
  vpc_id = "${data.aws_vpc.dev1.id}"
  filter {
    name   = "tag:Name"
    values = ["dev1-vpc-private-us-west-2b"]
  }
}

data "aws_route53_zone" "accuen" {
  name = "accuenplatform.com."
}
