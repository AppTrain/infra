terraform {
  backend "s3" {
    bucket = "com.annalect.dig.terraform"
    key    = "foundation.state"
    region = "us-west-2"
  }
}

variable env {
  description = "environment name"
  default     = "foundation"
}
