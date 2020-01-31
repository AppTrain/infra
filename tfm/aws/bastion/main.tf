resource "aws_key_pair" "bastion" {
  key_name   = "annalect-${var.env}-bastion"
  public_key = file(pathexpand("~/.annalect/ssh/${var.env}_bastion.pub"))
}
