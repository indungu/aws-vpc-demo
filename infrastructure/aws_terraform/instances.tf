# This creates the instances used for deploying the 
# Yummy Recipes project

# React App in the public subnet of Availability Zone A
resource "aws_instance" "yummy_front_tf_aza" {
  ami                         = "${data.aws_ami.yummy_react_image.id}"
  instance_type               = "t2.micro"
  availability_zone           = "${var.zone_a}"
  key_name                    = "${var.ssh_key}"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.yummy-tf-subnet-pub1.id}"
  security_groups             = ["${aws_security_group.yummy-pub-tf-secgrp.id}"]
  private_ip                  = "172.168.0.10"

  tags {
    Name = "yummy-react-tf-aza"
  }
}

# React App in the public subnet of Availability Zone B
resource "aws_instance" "yummy_front_tf_azb" {
  ami                         = "${data.aws_ami.yummy_react_image.id}"
  instance_type               = "t2.micro"
  availability_zone           = "${var.zone_b}"
  key_name                    = "${var.ssh_key}"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.yummy-tf-subnet-pub2.id}"
  security_groups             = ["${aws_security_group.yummy-pub-tf-secgrp.id}"]
  private_ip                  = "172.168.1.10"

  tags {
    Name = "yummy-react-tf-azb"
  }
}

# REST API App in the private subnet of Availability Zone A
resource "aws_instance" "yummy_rest_tf_aza" {
  ami               = "${data.aws_ami.yummy_rest_image.id}"
  instance_type     = "t2.micro"
  availability_zone = "${var.zone_a}"
  key_name          = "${var.ssh_key}"
  subnet_id         = "${aws_subnet.yummy-tf-subnet-priv1.id}"
  security_groups   = ["${aws_security_group.yummy-priv-tf-secgrp.id}"]
  private_ip        = "172.168.2.5"

  tags {
    Name = "yummy-rest-tf-aza"
  }
}

# REST API App in the public subnet of Availability Zone B
resource "aws_instance" "yummy_rest_tf_azb" {
  ami               = "${data.aws_ami.yummy_rest_image.id}"
  instance_type     = "t2.micro"
  availability_zone = "${var.zone_b}"
  key_name          = "${var.ssh_key}"
  subnet_id         = "${aws_subnet.yummy-tf-subnet-priv2.id}"
  security_groups   = ["${aws_security_group.yummy-priv-tf-secgrp.id}"]
  private_ip        = "172.168.3.5"

  tags {
    Name = "yummy-rest-tf-azb"
  }
}

# A NAT instance for eoutbound internet traffic from private subnets
resource "aws_instance" "yummy_tf_nat" {
  ami                         = "${data.aws_ami.yummy_nat_image.id}"
  instance_type               = "t2.micro"
  availability_zone           = "${var.zone_a}"
  key_name                    = "${var.ssh_key}"
  associate_public_ip_address = true
  source_dest_check           = false
  subnet_id                   = "${aws_subnet.yummy-tf-subnet-pub1.id}"
  security_groups             = ["${aws_security_group.yummy-nat-secgrp.id}", "${aws_security_group.yummy-pub-tf-secgrp.id}"]
  private_ip                  = "172.168.0.30"

  tags {
    Name = "yummy-tf-nat"
  }
}

# A database server instance for the backend applications
resource "aws_instance" "yummy_tf_db" {
  ami               = "${data.aws_ami.yummy_db_image.id}"
  instance_type     = "t2.micro"
  availability_zone = "${var.zone_a}"
  key_name          = "${var.ssh_key}"
  subnet_id         = "${aws_subnet.yummy-tf-subnet-priv1.id}"
  security_groups   = ["${aws_security_group.yummy_db_secgrp.id}"]
  private_ip        = "172.168.2.15"

  tags {
    Name = "yummy-tf-db"
  }
}
