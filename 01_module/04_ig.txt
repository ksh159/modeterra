resource "aws_internet_gateway" "ksh_ig" {
  vpc_id = aws_vpc.ksh_vpc.id

  tags = {
    Name = "ksh-ig"
  }
}