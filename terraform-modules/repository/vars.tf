variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "topics" {
  type = "list"
  default = [
    "annalect"
  ]
}

variable "buildkite_webhook" {
  type    = "string"
  default = "invalid"
}

## OUTPUT

output "github_html_url" {
  value = "${github_repository.this.html_url}"
}

output "github_ssh_clone_url" {
  value = "${github_repository.this.ssh_clone_url}"
}

output "ecr_repository_url" {
  value = "${aws_ecr_repository.this.repository_url}"
}

output "repo_md" {
  value = "${data.template_file.markdown.rendered}"
}