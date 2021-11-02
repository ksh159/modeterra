resource "aws_eip" "lb_ip_a" {
#   instance = aws_instance.web.id
  vpc = true
}
resource "aws_nat_gateway" "ksh_nga" {
  
  allocation_id  = aws_eip.lb_ip_a.id
  subnet_id      = aws_subnet.ksh_pub[0].id
  tags = {
    Name = "${var.name}-nga-${var.avazone[0]}"
  }
}

resource "aws_route_table" "ksh_ngart" {
  vpc_id  = aws_vpc.ksh_vpc.id

  route {
    cidr_block  = var.cidr
    gateway_id = aws_nat_gateway.ksh_nga.id
  }
  tags = {
    Name = "${var.name}-nga-rta"
  }
}

resource "aws_route_table_association" "ksh_ngartas" {
  count = 2
  subnet_id       = aws_subnet.ksh_pri[count.index].id
  route_table_id  = aws_route_table.ksh_ngart.id
}