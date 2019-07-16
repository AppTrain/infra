
resource "aws_security_group" "smp_db" {
  name = "annalect_smp_${var.env}"
  description = "security group for builder instances in environment: ${var.env}"
  vpc_id = "${data.aws_vpc.selected.id}"
  tags = {
    Name = "annalect_smp_${var.env}"
    env = "${var.env}"
  }
}

resource "aws_security_group_rule" "smp_db_outbound" {
  security_group_id = "${aws_security_group.smp_db.id}"

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}

resource "aws_security_group_rule" "bastion_to_smp" {
  # this allows traffic from bastion to talk to the builder instances
  security_group_id = "${aws_security_group.smp_db.id}"
  source_security_group_id = "${data.aws_security_group.bastion.id}"
  type = "ingress"
  protocol = "-1"
  from_port = 0
  to_port = 0
}
