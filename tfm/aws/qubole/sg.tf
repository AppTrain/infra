resource "aws_security_group" "qubole_bastion" {
  name        = "qubole-bastion-${var.env}"
  description = "security group for bastion in environment: ${var.env}"
  vpc_id      = module.qubole_vpc.vpc_id
  tags = {
    Name = "qubole-bastion-${var.env}"
    env  = var.env
  }
}

resource "aws_security_group_rule" "qubole_bastion_inbound" {
  security_group_id = aws_security_group.qubole_bastion.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = concat(var.qubole_access_ips, var.annalect_access_ips)

  from_port = 22
  to_port   = 22
}

resource "aws_security_group_rule" "qubole_7000_inbound" {
  # this is some unknown port needed to make qubole run.
  # security note: what is run on this port and how is it
  # authenticated and authorized?
  security_group_id = aws_security_group.qubole_bastion.id

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = var.qubole_access_ips

  from_port = 7000
  to_port   = 7000
}

resource "aws_security_group_rule" "qubole_bastion_outbound" {
  security_group_id = aws_security_group.qubole_bastion.id

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}

resource "aws_security_group" "qubole_rds" {
  name        = "qubole-rds-${var.env}"
  description = "base secruity group for rds in env ${var.env}"
  vpc_id      = module.qubole_vpc.vpc_id

  tags = {
    Name = "qubole-rds-${var.env}"
    env  = var.env
  }
}

resource "aws_security_group_rule" "qubole_rds_bastion" {
  # this allows traffic from jump box to talk to the rds instances
  security_group_id        = aws_security_group.qubole_rds.id
  source_security_group_id = aws_security_group.qubole_bastion.id
  type                     = "ingress"
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
}
