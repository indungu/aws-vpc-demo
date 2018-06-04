# yummy recipes vpc
provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "yummy-tf-vpc" {
  cidr_block       = "${var.vpc_cdir}"
  instance_tenancy = "default"

  tags {
    Name = "yummy-tf-vpc"
  }
}
