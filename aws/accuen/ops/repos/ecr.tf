resource "aws_ecr_repository" "python" {
  name = "python"
  tags = {
    Terraform = true
    github    = "${data.github_repository.python.html_url}"
    description = "python images"
  }
}

resource "aws_ecr_repository" "smp_deps" {
  name = "smp"
  tags = {
    Terraform = true
    github    = "${data.github_repository.smp.html_url}"
    description = "smp"
  }
}