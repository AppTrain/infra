resource "aws_security_group" "bastion" {
  name        = "annalect-bastion-${var.env}"
  description = "security group for bastion in environment: ${var.env}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "annalect-bastion-${var.env}"
    env  = var.env
  }
}

resource "aws_security_group_rule" "bastion_inbound" {
  security_group_id = aws_security_group.bastion.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.access_ips

  from_port = 22
  to_port   = 22
}

resource "aws_security_group_rule" "bastion_outbound" {
  security_group_id = aws_security_group.bastion.id

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}
