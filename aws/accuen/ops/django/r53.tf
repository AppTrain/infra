# resource "aws_route53_record" "internal_postgres" {
#   zone_id = "${module.this_buildenv.internal_zone_id}"
#   name    = "django.${var.env}.in.accuenplatform.com"
#   type    = "CNAME"
#   ttl     = 300
#   records = ["${module.django_clone.this_db_instance_address}"]
# }