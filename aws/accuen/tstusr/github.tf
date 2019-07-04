provider "github" {
  organization = "accuenmedia"
  version      = "2.1"
}

data "github_team" "accuen" {
  slug = "accuen"
}
