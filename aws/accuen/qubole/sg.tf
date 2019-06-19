
resource "aws_security_group" "qubole_bastion" {
  name = "annalect-dig-bastion-${var.env}"
  description = "security group for bastion in environment: ${var.env}"
  vpc_id = "${module.qubole_vpc.vpc_id}"
  tags = {
    Name = "annalect-dig-bastion-${var.env}"
    env = "${var.env}"
  }
}

resource "aws_security_group_rule" "qubole_bastion_inbound" {
  security_group_id = "${aws_security_group.qubole_bastion.id}"

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = "${concat(
    var.qubole_access_ips,
    var.annalect_access_ips,
  )}"

  from_port = 22
  to_port   = 22
}

resource "aws_security_group_rule" "qubole_bastion_outbound" {
  security_group_id = "${aws_security_group.qubole_bastion.id}"

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}