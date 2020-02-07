
# This role that will be attached to ec2 instance
resource "aws_iam_role" "dev_machine" {
  name               = "${local.env}_dev_machine"
  assume_role_policy = data.aws_iam_policy_document.dev_machine_assume_role.json
  path               = "/annalect/"
}

# Attaches role to ec2 instance
resource "aws_iam_instance_profile" "dev_machine" {
  name = "${local.env}_dev_machine"
  role = aws_iam_role.dev_machine.name
  path = "/annalect/"
}

# Attaches dev capabilities policy to role that is attached to ec2 instance
resource "aws_iam_role_policy_attachment" "dev_machines" {
  role       = aws_iam_role.dev_machine.name
  policy_arn = aws_iam_policy.dev_capabilities.arn
}


# The primary AssumeRole policy document for the ec2 instance role
data "aws_iam_policy_document" "dev_machine_assume_role" {
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
