resource "aws_internet_gateway" "web" {
  vpc_id = aws_vpc.web.id
}

resource "aws_default_route_table" "web" {
  default_route_table_id = aws_vpc.web.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.web.id
  }
}

resource "aws_route_table_association" "web" {
  subnet_id      = aws_subnet.web.id
  route_table_id = aws_default_route_table.web.id
}