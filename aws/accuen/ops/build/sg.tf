
resource "aws_security_group" "builder" {
  name = "annalect-buildenv-${var.env}"
  description = "security group for builder instances in environment: ${var.env}"
  vpc_id = "${data.aws_vpc.selected.id}"
  tags = {
    Name = "annalect-buildenv-${var.env}"
    env = "${var.env}"
  }
}

resource "aws_security_group_rule" "builder_inbound" {
  security_group_id = "${aws_security_group.builder.id}"

  type     = "ingress"
  protocol = "tcp"

  cidr_blocks = ["10.0.0.0/16"]

  from_port = 22
  to_port   = 22
}

resource "aws_security_group_rule" "builder_outbound" {
  security_group_id = "${aws_security_group.builder.id}"

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}

resource "aws_security_group_rule" "bastion_to_builder" {
  # this allows traffic from bastion to talk to the builder instances
  security_group_id = "${aws_security_group.builder.id}"
  source_security_group_id = "${data.aws_security_group.bastion.id}"
  type = "ingress"
  protocol = "-1"
  from_port = 0
  to_port = 0
}
