data "template_file" "markdown" {
  template = "${file("${path.module}/repo.md")}"
  vars = {
    name        = "${var.name}"
    description = "${var.description}"
    topics      = "${join(", ", var.topics)}"
    github      = "${github_repository.this.html_url}"
    clone       = "${github_repository.this.ssh_clone_url}"
    ecr         = "${aws_ecr_repository.this.repository_url}"
  }
}

resource "local_file" "markdown" {
  content  = "${data.template_file.markdown.rendered}"
  filename = "${path.cwd}/docs/repo_${var.name}.md"
}