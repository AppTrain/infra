provider "github" {
  organization = "accuenmedia"
  version = "2.1"
}

resource "github_user_ssh_key" "buildkite" {
  title = "buildkite build env 2019 07"
  key   = "${file("${pathexpand("~/.annalect/ssh/buildkite.pub")}")}"
}
