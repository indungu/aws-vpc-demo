# This file configures Route 53 dns routes 

# Frontend load balancer DNS record
resource "aws_route53_record" "yummyrecipes_tf_alias" {
  zone_id = "${data.aws_route53_zone.personal_domain.zone_id}"
  name    = "yummyrecipestf"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_lb.yummy_front_tf_elb.dns_name}"]
}

# Backend load balancer DNS record
resource "aws_route53_record" "yummyrecipes_rest_tf_alias" {
  zone_id = "${data.aws_route53_zone.personal_domain.zone_id}"
  name    = "api.yummyrecipestf"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_lb.yummy_back_tf_elb.dns_name}"]
}
