resource "aws_key_pair" "entrypoint" {
  key_name   = "annalect-${var.env}-entrypoint"
  public_key = "${file("${pathexpand("../../etc/entrypoint.pub")}")}"
}
