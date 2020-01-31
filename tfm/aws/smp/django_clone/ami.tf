data "aws_caller_identity" "this" {
}

data "aws_ami" "smp_db" {
  most_recent = true

  filter {
    name   = "name"
    values = ["annalect_smp_db*"]
  }

  owners = [data.aws_caller_identity.this.account_id]
}
