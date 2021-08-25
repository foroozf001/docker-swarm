resource "aws_vpc" "web" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = "10.0.0.0/16"
}

resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.web.id
  cidr_block              = cidrsubnet(aws_vpc.web.cidr_block, 4, 1)
  map_public_ip_on_launch = true
}