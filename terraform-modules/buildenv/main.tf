resource "aws_key_pair" "ansible" {
  key_name   = "annalect-buildenv-${var.env}-ansible"
  public_key = "${var.public_key}"
}