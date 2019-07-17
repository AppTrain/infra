

# resource "github_repository" "this" {
#     name = "packer-buildenv"
#     description = "build environment with buildkite"
#     private = true
#     homepage_url = "https://www.annalect.com/"
#     has_issues = false
#     has_wiki = false
#     has_projects = false
#     gitignore_template = "Python"
#     topics = ["packer", "ami"]
# }

# resource "github_team_repository" "this" {
#   team_id    = "${data.github_team.accuen.id}"
#   repository = "${github_repository.this.name}"
#   permission = "admin"
# }
