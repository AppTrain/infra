data "aws_caller_identity" "this" {
}

data "aws_ami" "this" {
  filter {
    name   = "name"
    values = [var.env_version]
  }

  owners = [data.aws_caller_identity.this.account_id]
}
