# This file contains computed data sources

# The REST API image filter
data "aws_ami" "yummy_rest_image" {
  filter {
    name   = "name"
    values = ["yummy-rest-no-db-image*"]
  }

  most_recent = true
}

# The REACT APP image filter
data "aws_ami" "yummy_react_image" {
  filter {
    name   = "name"
    values = ["yummy-react-image*"]
  }

  most_recent = true
}

# The REST API database image filter
data "aws_ami" "yummy_db_image" {
  filter {
    name   = "name"
    values = ["yummy-rest-db-image*"]
  }

  most_recent = true
}

# The NAT image filter
data "aws_ami" "yummy_nat_image" {
  filter {
    name   = "name"
    values = ["ubuntu-xenial-nat"]
  }

  most_recent = true
}

# hosted DNS network
data "aws_route53_zone" "personal_domain" {
  name         = "indungu.gq."
  private_zone = false
}
