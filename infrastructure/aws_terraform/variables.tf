variable "region" {
  default = "us-east-2"
}

variable "zone_a" {
  default = "us-east-2a"
}

variable "zone_b" {
  default = "us-east-2b"
}

variable "vpc_cdir" {
  default = "172.168.0.0/22"
}

variable "public_subnet1_cidr" {
  default = "172.168.0.0/24"
}

variable "public_subnet2_cidr" {
  default = "172.168.1.0/24"
}

variable "private_subnet1_cidr" {
  default = "172.168.2.0/24"
}

variable "private_subnet2_cidr" {
  default = "172.168.3.0/24"
}

variable "ssh_key" {
  default = "yummy"
}

# variable "api_ami" {
#   default = "ami-0932b3342ec0a0674"
# }


# variable "frontend_ami" {
#   default = "ami-00f09436874cbf524"
# }


# variable "db_ami" {
#   default = "ami-018df8283a8895fed"
# }


# variable "nat_ami" {
#   default = "ami-0ee6a01b94febac19"
# }

