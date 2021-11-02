resource "aws_route_table" "ksh_ngart_a" {
  vpc_id  = aws_vpc.ksh_vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ksh_nga_a.id
  }
  tags = {
    Name = "ksh-nga-rta"
  }
}

resource "aws_route_table" "ksh_ngart_c" {
  vpc_id  = aws_vpc.ksh_vpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ksh_nga_c.id
  }
  tags = {
    Name = "ksh-nga-rtc"
  }
}