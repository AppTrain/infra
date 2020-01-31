resource "aws_iam_group" "admin" {
  name = var.group_name
  path = var.iam_path
}
