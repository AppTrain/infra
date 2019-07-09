data "aws_route53_zone" "inside" {
  name         = "build-ops.in.accuenplatform.com."
  private_zone = true
}

data "aws_route53_zone" "outside" {
  name         = "build-ops.out.accuenplatform.com."
}

resource "aws_route53_record" "internal_postgres" {
  zone_id = "${data.aws_route53_zone.inside.id}"
  name    = "djangoclone.build-ops.in.accuenplatform.com"
  type    = "CNAME"
  ttl     = 300
  records = ["${module.django_clone.this_db_instance_address}"]
}