terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "dev1env.state"
    region = "us-west-2"
  }
}

# provider "aws" {
#   region = "us-west-2"
#   version = "2.15"
# }

locals {
  env = "dev1"
}
