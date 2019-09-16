resource "aws_ecr_repository" "this" {
  name = "accuenmedia/${var.name}"
  tags = {
    Terraform   = true
    github      = "${data.github_repository.this.html_url}"
    description = "${var.description}"
  }
}
