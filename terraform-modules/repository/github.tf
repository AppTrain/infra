
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

# resource "github_repository" "docker_python" {
#   full_name = "accuenmedia/docker-python"
# }

# resource "github_repository_webhook" "infra" {
#   repository = "${data.github_repository.infra.name}"

#   configuration {
#     url          = "https://google.de/"
#     content_type = "form"
#     insecure_ssl = false
#   }

#   active = false

#   events = ["push"]
# }

resource "github_team_repository" "this" {
  team_id    = "${data.github_team.accuen.id}"
  repository = "${github_repository.this.name}"
  permission = "admin"
}
