data "aws_caller_identity" "this" {
}

data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["annalect_analytics_env*"]
  }

  owners = [data.aws_caller_identity.this.account_id]
}
