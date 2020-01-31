
data "github_team" "accuen" {
  slug = "accuen"
}

data "github_repository" "this" {
  name = "${var.name}"
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

# resource "github_team_repository" "this" {
#   team_id    = "${data.github_team.accuen.id}"
#   repository = "${github_repository.this.name}"
#   permission = "admin"
# }
