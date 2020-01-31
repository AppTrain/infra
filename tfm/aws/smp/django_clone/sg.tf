resource "aws_security_group" "smp_db" {
  name        = "annalect_smp_${var.env}"
  description = "security group for builder instances in environment: ${var.env}"
  vpc_id      = var.vpc_id
  tags = {
    Name = "annalect_smp_${var.env}"
    env  = var.env
  }
}

resource "aws_security_group_rule" "smp_db_outbound" {
  security_group_id = aws_security_group.smp_db.id

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}

resource "aws_security_group_rule" "smp_db_inbound" {
  security_group_id = aws_security_group.smp_db.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = ["10.44.0.0/16"]

  from_port = 5432
  to_port   = 5432
}

resource "aws_security_group_rule" "from_default_vpc" {
  security_group_id = aws_security_group.smp_db.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = ["172.31.0.0/16"]

  from_port = 5432
  to_port   = 5432
}

resource "aws_security_group_rule" "bastion_to_smp" {
  # this allows traffic from bastion to talk to the builder instances
  security_group_id        = aws_security_group.smp_db.id
  source_security_group_id = var.bastion_security_group_id
  type                     = "ingress"
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
}
