terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "dev_user_keys.state"
    region = "us-west-2"
  }
}
