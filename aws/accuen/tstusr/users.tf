variable "user_path" {
  default = "/ops/test/"
}

# locals {
#     users = "${[for m in data.github_team.accuen.members : lower(m['name'])]}"
# }

## WAITING
## https://github.com/hashicorp/terraform/issues/17179

/*
RANDOM IDEA -
When the above is implemented it will be easy to propagate user level
data from github to other services. Removing user from github team would
have cascading effects across these other services.

github also is a nice ui for storing and managing ssh keys
*/

# resource "aws_iam_user" "user" {
#     count = length(local.users)
#     name = "@${}"
#     path = "/ops/test/"
# }
