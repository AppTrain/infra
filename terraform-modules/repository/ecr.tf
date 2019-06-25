resource "aws_ecr_repository" "this" {
  name = "accuenmedia/${var.name}"
  tags = {
    Terraform = true
    github    = "${github_repository.this.html_url}"
    description = "${var.description}"
    topics = "${join(" ", var.topics)}"
  }
}