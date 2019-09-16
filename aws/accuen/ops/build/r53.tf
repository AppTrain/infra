data "aws_route53_zone" "outside" {
  name = "build-ops.out.accuenplatform.com."
}

resource "aws_route53_record" "builder" {
  zone_id = "${data.aws_route53_zone.outside.id}"
  name    = "b${count.index}.build-ops.out.accuenplatform.com"
  type    = "A"
  ttl     = 300
  records = ["${aws_instance.builder[count.index].private_ip}"]
  count   = "${var.builder_count}"
}
