
output "vpc_id" {
  value = "${module.this_vpc.vpc_id}"
}

output "private_subnets" {
  value = "${module.this_vpc.private_subnets}"
}

# output "builder_security_group_id" {
#     value = "${aws_security_group.builder.id}"
# }

output "internal_zone_id" {
  value = "${aws_route53_zone.internal.zone_id}"
}

output "external_zone_id" {
  value = "${aws_route53_zone.external.zone_id}"
}