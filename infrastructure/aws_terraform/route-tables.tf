# This configures the route tables used by the Yummy
# Recipes VPC
# Add internet gateway
resource "aws_internet_gateway" "yummy-recipes-tf-igw" {
  vpc_id = "${aws_vpc.yummy-tf-vpc.id}"
}

# A custom route table with the IGW attached
resource "aws_route_table" "yummy-pub-tf-rtb" {
  vpc_id = "${aws_vpc.yummy-tf-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.yummy-recipes-tf-igw.id}"
  }

  tags {
    Name = "yummy-pub-tf-rtb"
  }
}

# Associate all public subnets with the public route table
resource "aws_route_table_association" "pub1_rtb_assoc" {
  route_table_id = "${aws_route_table.yummy-pub-tf-rtb.id}"
  subnet_id      = "${aws_subnet.yummy-tf-subnet-pub1.id}"
}

resource "aws_route_table_association" "pub2_rtb_assoc" {
  route_table_id = "${aws_route_table.yummy-pub-tf-rtb.id}"
  subnet_id      = "${aws_subnet.yummy-tf-subnet-pub2.id}"
}

# Default VPC traffic route table
resource "aws_default_route_table" "yummy_def_rtb" {
  default_route_table_id = "${aws_vpc.yummy-tf-vpc.default_route_table_id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.yummy_tf_nat.id}"
  }

  tags {
    Name = "yummy-def-rtb"
  }
}

# Associate all private subnets with the default route table
resource "aws_route_table_association" "priv1_rtb_assoc" {
  route_table_id = "${aws_vpc.yummy-tf-vpc.default_route_table_id}"
  subnet_id      = "${aws_subnet.yummy-tf-subnet-priv1.id}"
}

resource "aws_route_table_association" "priv2_rtb_assoc" {
  route_table_id = "${aws_vpc.yummy-tf-vpc.default_route_table_id}"
  subnet_id      = "${aws_subnet.yummy-tf-subnet-priv2.id}"
}
