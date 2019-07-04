terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "annalectualops"
    workspaces {
      name = "tst"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  version = "2.15"
}

provider "github" {
  organization = "accuenmedia"
  version = "2.1"
}

variable env {
  description = "environment name"
  default     = "tfe"
}

module example_tfe {
    source = "../../../terraform-modules/repository"
    name = "tfe_example"
    description = "accuen pipeline data"
}
