terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "dc_dev_dev1.state"
    region = "us-west-2"
  }
}

locals {
  ip = {
    sf_office              = "12.154.43.233/32",
    jason_home             = "73.42.71.80/32",
    matt_home              = "104.174.30.104/32",
    mike_home              = "108.193.156.146/32",
    orlando_starter_studio = "64.132.248.102/32",
    jeremiah_office        = "104.136.141.97/32",
    jeremiah_home          = "45.30.144.158/32",
    ben_home               = "104.2.173.152/32",
    jonny_home             = "157.131.98.149/32",
  }
}
