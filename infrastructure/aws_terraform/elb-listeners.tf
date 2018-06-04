# This configures the listeners for the application load balancers
# for both the frontend and the backend appslications

# Frontend ELB listener
resource "aws_lb_listener" "yummy_front_tf_elb_listener" {
  load_balancer_arn = "${aws_lb.yummy_front_tf_elb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.yummy_react_tf_tgrp.arn}"
    type             = "forward"
  }
}

# Backend ELB listener
resource "aws_lb_listener" "yummy_back_tf_elb_listener" {
  load_balancer_arn = "${aws_lb.yummy_back_tf_elb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.yummy_rest_tf_tgrp.arn}"
    type             = "forward"
  }
}
