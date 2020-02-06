data "aws_route53_zone" "outside" {
  name = "${var.env}.out.accuenplatform.com."
}

resource "aws_route53_record" "builder" {
  zone_id = data.aws_route53_zone.outside.id
  name    = "${var.user}-smp-dev.${var.env}.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.smp_dev.public_ip]
}
