# This file configures the Target groups for both
# the frontend and backend elbs

# A target group for the frontend app
resource "aws_lb_target_group" "yummy_react_tf_tgrp" {
  name     = "yummy-react-tf-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.yummy-tf-vpc.id}"
}

# registering target instances
# React app zone a
resource "aws_lb_target_group_attachment" "attach_react_zone_a" {
  target_group_arn = "${aws_lb_target_group.yummy_react_tf_tgrp.arn}"
  target_id        = "${aws_instance.yummy_front_tf_aza.id}"
  port             = "80"
}

# React app zone b
resource "aws_lb_target_group_attachment" "attach_react_zone_b" {
  target_group_arn = "${aws_lb_target_group.yummy_react_tf_tgrp.arn}"
  target_id        = "${aws_instance.yummy_front_tf_azb.id}"
  port             = "80"
}

# A target group for the backend api
resource "aws_lb_target_group" "yummy_rest_tf_tgrp" {
  name     = "yummy-rest-tf-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.yummy-tf-vpc.id}"
}

# registering target instances
# REST API zone a
resource "aws_lb_target_group_attachment" "attach_rest_zone_a" {
  target_group_arn = "${aws_lb_target_group.yummy_rest_tf_tgrp.arn}"
  target_id        = "${aws_instance.yummy_rest_tf_aza.id}"
  port             = "80"
}

# REST API zone b
resource "aws_lb_target_group_attachment" "attach_rest_zone_b" {
  target_group_arn = "${aws_lb_target_group.yummy_rest_tf_tgrp.arn}"
  target_id        = "${aws_instance.yummy_rest_tf_azb.id}"
  port             = "80"
}
