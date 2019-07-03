
# resource "aws_ecr_repository" "ops" {
#   name = "annalect-dig-${var.env}"
#   tags = {
#     Terraform = true
#     env       = "${var.env}"
#     test      = "1"
#   }

#   provisioner "local-exec" {
#     command = "echo ${templatefile("${path.module}/docker.md.tpl", { url = "${aws_ecr_repository.ops.repository_url}" })} > docker.md"
#   }
# }
