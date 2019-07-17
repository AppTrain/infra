# Attaches role to ec2 instance
resource "aws_iam_instance_profile" "build_env_ec2" {
  name = "${var.env}_buildenv"
  role = "${aws_iam_role.build_env_ec2.name}"
  path = "/annalect/"
}

# Attaches build_env policy to role that is attached to ec2 instance
resource "aws_iam_role_policy_attachment" "build_env_ec2" {
  role       = "${aws_iam_role.build_env_ec2.name}"
  policy_arn = "${aws_iam_policy.build_env.arn}"
}

# This role that will be attached to ec2 instance
resource "aws_iam_role" "build_env_ec2" {
  name               = "${var.env}_buildenv"
  assume_role_policy = "${data.aws_iam_policy_document.build_env_ec2.json}"
  path               = "/annalect/"
}

# The primary AssumeRole policy document for the ec2 instance role
data "aws_iam_policy_document" "build_env_ec2" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"
    sid    = ""
  }
}
