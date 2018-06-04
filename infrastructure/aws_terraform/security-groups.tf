# This declares the secutity groups for yummy recipes vpc

# the security group for instances in any private subnet
resource "aws_security_group" "yummy-priv-tf-secgrp" {
  name        = "yummy-priv-tf-secgrp"
  description = "Inbound security group for private subnet instances"
  vpc_id      = "${aws_vpc.yummy-tf-vpc.id}"

  # intranet http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cdir}"]
  }

  # Intranet https
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cdir}"]
  }

  # intranet icmp from instances in VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["${var.vpc_cdir}"]
  }

  # intranet ssh from public subnets to private subnet instances
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet1_cidr}", "${var.public_subnet2_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "yummy-priv-tf-secgrp"
  }
}

# The security group for instances in the public subnets
resource "aws_security_group" "yummy-pub-tf-secgrp" {
  name        = "yummy-pub-tf-secgrp"
  description = "Inbound security group for private subnet instances"
  vpc_id      = "${aws_vpc.yummy-tf-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "yummy-pub-tf-secgrp"
  }
}

# The security group for the nat instance(s)
resource "aws_security_group" "yummy-nat-secgrp" {
  name        = "yummy-nat-secgrp"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.yummy-tf-vpc.id}"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.yummy-pub-tf-secgrp.id}"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.yummy-priv-tf-secgrp.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "yummy-nat-secgrp"
  }
}

# The security group for the Database instance(s)
resource "aws_security_group" "yummy_db_secgrp" {
  name        = "yummy-db-tf-secgrp"
  description = "A security group for database instances"
  vpc_id      = "${aws_vpc.yummy-tf-vpc.id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.168.0.0/22"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "yummy-db-tf-secgrp"
  }
}
