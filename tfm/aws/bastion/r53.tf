data "aws_route53_zone" "external" {
  name = "${var.env}.out.accuenplatform.com."
}
