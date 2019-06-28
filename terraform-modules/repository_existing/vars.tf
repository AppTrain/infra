variable "name" {
    type = "string"  
}

variable "description" {
    type = "string"
}

## OUTPUT

output "github_html_url" {
    value = "${data.github_repository.this.html_url}"
}

output "github_ssh_clone_url" {
    value = "${data.github_repository.this.ssh_clone_url}"
}

output "ecr_repository_url" {
    value = "${aws_ecr_repository.this.repository_url}"
}