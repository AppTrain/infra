provider "github" {
  organization = "accuenmedia"
}

data "github_repository" "infra" {
  full_name = "accuenmedia/infra"
}

resource "github_repository_webhook" "infra" {
  repository = "${data.github_repository.infra.name}"

  configuration {
    url          = "https://google.de/"
    content_type = "form"
    insecure_ssl = false
  }

  active = false

  events = ["push"]
}
