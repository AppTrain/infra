variable "rds_username" {
  description = "rds user name"
  default = "accuen"
}

variable "rds_password" {
  description = "rds password"
}

data "aws_db_snapshot" "django" {
  db_instance_identifier = "django"
  db_snapshot_identifier = "rds:django-2019-07-08-06-39"
}

module "django_clone" {
  source            = "terraform-aws-modules/rds/aws"
  identifier        = "django-clone-${var.env}"
  engine            = "postgres"
  engine_version    = "10.7"
  instance_class    = "db.r5.xlarge"
  allocated_storage = 2000
  storage_encrypted = false
  multi_az          = true
  snapshot_identifier = "${data.aws_db_snapshot.django.id}" # provision this rds instance with this snapshot
  name     = "django"
  username = "${var.rds_username}"
  password = "${var.rds_password}"
  port     = 5432
  #iam_database_authentication_enabled = true
  vpc_security_group_ids  = ["${aws_security_group.django_clone.id}"]
  subnet_ids              = ["${data.aws_subnet.west_2a.id}", "${data.aws_subnet.west_2b.id}"]
  maintenance_window      = "Mon:00:00-Mon:03:00"
  apply_immediately = true
  backup_window           = "03:00-06:00"
  backup_retention_period = 1
  #monitoring_interval = "30"
  #monitoring_role_name = "DjangoRDSMonitoringRole-${var.env}"
  create_monitoring_role = false
  skip_final_snapshot = true
  publicly_accessible = false
  final_snapshot_identifier = "tmpdjango-deleteme"

  tags = {
    Name        = "django-clone-${var.env}"
    Environment = "${var.env}"
  }
  family                    = "postgres10"
  major_engine_version      = "10"
}

resource "aws_security_group" "django_clone" {
  name        = "django-clone-${var.env}"
  description = "base secruity group for django clone db"
  vpc_id      = "${data.aws_vpc.selected.id}"

  tags = {
    Name = "django-clone-${var.env}"
    env  = "${var.env}"
  }
}

resource "aws_security_group_rule" "django_clone_builder" {
  # this allows traffic to the rds instances
  security_group_id = "${aws_security_group.django_clone.id}"
  source_security_group_id = "${data.aws_security_group.builder.id}"
  type = "ingress"
  protocol = "-1"
  from_port = 0
  to_port = 0
}
