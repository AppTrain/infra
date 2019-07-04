terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    config = {
        organization = "annalectualops"
        workspaces {
            name = "tst"
        }
    }
  }
}