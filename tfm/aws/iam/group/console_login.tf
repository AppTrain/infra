resource "aws_iam_group" "console_login" {
  name = var.group_name
  path = var.iam_path
}
