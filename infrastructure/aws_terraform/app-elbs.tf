#  This file configures Application load balancers
#  Front end load balancer
resource "aws_lb" "yummy_front_tf_elb" {
  name                       = "yummy-front-tf-elb"
  enable_deletion_protection = false
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.yummy-pub-tf-secgrp.id}"]
  subnets                    = ["${aws_subnet.yummy-tf-subnet-pub1.id}", "${aws_subnet.yummy-tf-subnet-pub2.id}"]

  tags {
    Name = "yummy-front-tf-elb"
  }
}

#  Backend load balancer
resource "aws_lb" "yummy_back_tf_elb" {
  name                       = "yummy-back-tf-elb"
  enable_deletion_protection = false
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.yummy-pub-tf-secgrp.id}"]
  subnets                    = ["${aws_subnet.yummy-tf-subnet-pub1.id}", "${aws_subnet.yummy-tf-subnet-pub2.id}"]

  tags {
    Name = "yummy-back-tf-elb"
  }
}
