
resource "aws_key_pair" "dev_user_keys" {
  for_each   = var.users
  key_name   = "dev_user_${each.key}"
  public_key = file(each.value)
}
