variable "rds_username" {
  description = "rds user name"
}

variable "rds_password" {
  description = "rds password"
}

# data "aws_db_snapshot" "db_snapshot" {
#   # https://www.terraform.io/docs/providers/aws/d/db_snapshot.html
#   # How this will be configured should be easiest thing that works
#   # but may take some changes and more testing when implementing 
#   # with production
#   db_instance_identifier = "annalect-dig-${var.env}"
#   db_snapshot_identifier = "annalect-dig-${var.env}-orig"
# }

resource "random_string" "unique_snapshot_id" {
  length = 8
  special = false
}

module "quboledb" {
  source            = "terraform-aws-modules/rds/aws"
  identifier        = "qubole-app-db-${var.env}"
  engine            = "mysql"
  engine_version    = "8.0.15"
  instance_class    = "db.m5.xlarge"
  allocated_storage = 100
  storage_encrypted = true
  multi_az          = false
  #snapshot_identifier = "${data.aws_db_snapshot.db_snapshot.id}" # provision this rds instance with this snapshot
  # kms_key_id = "arm:aws:kms:<region>:<account id>:key/<kms key id>"

  name     = "annalectdig${var.env}"
  username = "${var.rds_username}"
  password = "${var.rds_password}"
  port     = 3306
  #iam_database_authentication_enabled = true
  vpc_security_group_ids  = ["${aws_security_group.qubole_rds.id}"]
  subnet_ids              = "${module.qubole_vpc.private_subnets}"
  maintenance_window      = "Mon:00:00-Mon:03:00"
  apply_immediately = true
  backup_window           = "03:00-06:00"
  backup_retention_period = 30

  # https://github.com/terraform-aws-modules/terraform-aws-rds/issues/136
  # waiting on resolution to bump that back to 30
  monitoring_interval = 0 #30
  monitoring_role_name = "RDSMonitoringRole-${var.env}"
  create_monitoring_role = true
  skip_final_snapshot = false

  publicly_accessible = false

  tags = {
    Name        = "annalect-dig-rds-${var.env}"
    Environment = "${var.env}"
  }
  family                    = "mysql8.0"
  major_engine_version      = "8.0"
  final_snapshot_identifier = "annalect-dig-${var.env}-db-snapshot-${random_string.unique_snapshot_id.result}"
}
