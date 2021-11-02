resource "aws_eip" "lb_ip_a" {
  vpc = true
}

resource "aws_eip" "lb_ip_c" {
#   instance = aws_instance.web.id
  vpc = true
}

resource "aws_nat_gateway" "ksh_nga_a" {
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id = aws_subnet.ksh_pria.id
  tags = {
    Name = "ksh-nga-a"
  }
}

resource "aws_nat_gateway" "ksh_nga_c" {
  allocation_id = aws_eip.lb_ip_c.id
  subnet_id = aws_subnet.ksh_pric.id
  tags = {
    Name = "ksh-nga-c"
  }
}