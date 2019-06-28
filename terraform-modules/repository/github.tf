
data "github_team" "accuen" {
  slug = "accuen"
}

resource "github_repository" "this" {
    name = "${var.name}"
    description = "${var.description}"
    private = true
    homepage_url = "https://www.annalect.com/"
    has_issues = false
    has_wiki = false
    has_projects = false
    gitignore_template = "Python"
    topics = "${var.topics}"
}

resource "github_repository_webhook" "infra" {
  repository = "${github_repository.this.name}"
  count = "${var.buildkite_webhook == "invalid" ? 0 : 1}"

  configuration {
    url          = "${var.buildkite_webhook}"
    content_type = "form"
    insecure_ssl = false
  }

  active = true

  events = ["push"]
}

resource "github_team_repository" "this" {
  team_id    = "${data.github_team.accuen.id}"
  repository = "${github_repository.this.name}"
  permission = "admin"
}
