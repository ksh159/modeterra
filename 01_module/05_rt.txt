resource "aws_route_table" "ksh_rt" {
  vpc_id = aws_vpc.ksh_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.ksh_ig.id
    }


  tags = {
    Name = "ksh-rt"
  }
}