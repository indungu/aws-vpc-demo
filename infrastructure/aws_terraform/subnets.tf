# Adds 4 subnets in yummy-tf-vpc
# 2 public subnets and 2 private subnets

resource "aws_subnet" "yummy-tf-subnet-pub1" {
  vpc_id            = "${aws_vpc.yummy-tf-vpc.id}"
  cidr_block        = "${var.public_subnet1_cidr}"
  availability_zone = "${var.zone_a}"

  tags = {
    Name = "yummy-tf-subnet-pub1"
  }
}

resource "aws_subnet" "yummy-tf-subnet-pub2" {
  vpc_id            = "${aws_vpc.yummy-tf-vpc.id}"
  cidr_block        = "${var.public_subnet2_cidr}"
  availability_zone = "${var.zone_b}"

  tags = {
    Name = "yummy-tf-subnet-pub2"
  }
}

resource "aws_subnet" "yummy-tf-subnet-priv1" {
  vpc_id            = "${aws_vpc.yummy-tf-vpc.id}"
  cidr_block        = "${var.private_subnet1_cidr}"
  availability_zone = "${var.zone_a}"

  tags = {
    Name = "yummy-tf-subnet-priv1"
  }
}

resource "aws_subnet" "yummy-tf-subnet-priv2" {
  vpc_id            = "${aws_vpc.yummy-tf-vpc.id}"
  cidr_block        = "${var.private_subnet2_cidr}"
  availability_zone = "${var.zone_b}"

  tags = {
    Name = "yummy-tf-subnet-priv2"
  }
}
