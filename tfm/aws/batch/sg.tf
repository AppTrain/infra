resource "aws_security_group" "batch" {
  name   = "batch_compute_environment_security_group_${var.env}"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "batch" {
  security_group_id = aws_security_group.batch.id

  type     = "egress"
  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]

  from_port = 0
  to_port   = 0
}
