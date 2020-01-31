data "aws_caller_identity" "this" {
}

data "aws_ami" "bastion" {
  most_recent = true

  filter {
    name   = "name"
    values = ["annalect_bastion*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [data.aws_caller_identity.this.account_id]
}
