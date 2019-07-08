resource "aws_key_pair" "ansible" {
  key_name   = "annalect-buildenv-${var.env}-ansible"
  public_key = "${var.public_key}"
}

resource "aws_key_pair" "packer_smp" {
  key_name   = "annalect-temp-${var.env}-packer-smp"
  public_key = "${file("${pathexpand("~/.annalect/ssh/packer_smp.pub")}")}"
}