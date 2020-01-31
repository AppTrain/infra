data "aws_route53_zone" "outside" {
  name = "${var.env}.out.accuenplatform.com."
}

resource "aws_route53_record" "builder" {
  count   = length(var.instances)
  zone_id = data.aws_route53_zone.outside.id
  name    = "${var.instances[count.index]}-smp-db.${var.env}.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = ["aws_instance.smp_db[count.index].private_ip"]
}
