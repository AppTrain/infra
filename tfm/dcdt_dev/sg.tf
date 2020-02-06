resource "aws_security_group" "this" {
  name        = "annalect_smp_${var.env}_${var.user}"
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

resource "aws_security_group_rule" "this_inbound" {
  security_group_id = aws_security_group.this.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.access_ips

  from_port = 0
  to_port   = 65535
}
