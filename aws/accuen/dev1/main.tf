terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "dev1env.state"
    region = "us-west-2"
  }
}

data aws_caller_identity "this" {

}

locals {
  env = "dev1"
}
