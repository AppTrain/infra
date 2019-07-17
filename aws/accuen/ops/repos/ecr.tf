resource "aws_ecr_repository" "python" {
  name = "python"
  tags = {
    Terraform = true
    github    = "${data.github_repository.python.html_url}"
    description = "python images"
  }
}