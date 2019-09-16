
## LEAVING THIS HERE TO REMIND ME
## THAT ECR WON'T LET ME HAVE NICE
## DOMIAN NAMES. DAMN THEM.

# could not find data source to grab just domain,
# just setting variable for now.
# variable "registry_host" {
#     default = "348194362585.dkr.ecr.us-west-2.amazonaws.com"
# }

# data "aws_route53_zone" "main" {
#   name         = "accuenplatform.com."
# }

# resource "aws_route53_record" "dkr" {
#   zone_id = "${data.aws_route53_zone.main.id}"
#   name    = "dkr.accuenplatform.com"
#   type    = "CNAME"
#   ttl     = 300
#   records = ["${var.registry_host}"]
# }
