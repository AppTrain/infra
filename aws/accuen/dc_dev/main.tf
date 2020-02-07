terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "dc_dev_dev1.state"
    region = "us-west-2"
  }
}
