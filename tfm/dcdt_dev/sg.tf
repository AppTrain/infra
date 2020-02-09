resource "aws_security_group" "this" {
  name        = "${var.env}_for_${var.user}"
  description = "security group for builder instances in environment: ${var.env} user: ${var.user}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "annalect_smp_${var.env}"
    env  = var.env
    user = var.user
  }
}

resource "aws_security_group_rule" "this_outbound" {
  security_group_id = aws_security_group.this.id

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 65535
}

resource "aws_security_group_rule" "this_inbound_22" {
  security_group_id = aws_security_group.this.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.access_ssh

  from_port = 22
  to_port   = 22
}

resource "aws_security_group_rule" "this_inbound_80" {
  security_group_id = aws_security_group.this.id
  # TODO: SECURITY: FIX

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.access_web

  from_port = 80
  to_port   = 80
}

resource "aws_security_group_rule" "this_inbound_443" {
  security_group_id = aws_security_group.this.id
  # TODO: SECURITY: FIX

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.access_web

  from_port = 443
  to_port   = 443
}

resource "aws_security_group_rule" "this_inbound_mosh" {
  security_group_id = aws_security_group.this.id

  type     = "ingress"
  protocol = "udp"

  cidr_blocks = var.access_ssh

  from_port = 60001
  to_port   = 60001
}

resource "aws_security_group_rule" "this_inbound_eternal_terminal" {
  security_group_id = aws_security_group.this.id

  type     = "ingress"
  protocol = "udp"

  cidr_blocks = var.access_ssh

  from_port = 2022
  to_port   = 2022
}
