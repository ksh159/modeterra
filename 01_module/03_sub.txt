# 가용영역 a의 Public Subnet
resource "aws_subnet" "ksh_puba" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone =   "ap-northeast-2a"

  tags = {
    Name = "ksh-puba"
  }
}

# 가용영역 a의 Private Subnet
resource "aws_subnet" "ksh_pria" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone =   "ap-northeast-2a"
  tags = {
    Name = "ksh-pria"
  }
}

# 가용영역 c의 Public Subnet
resource "aws_subnet" "ksh_pubc" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone =  "ap-northeast-2c"
  tags = {
    Name = "ksh-pubc"
  }
}

# 가용영역 c의 Private Subnet
resource "aws_subnet" "ksh_pric" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "ksh-pric"
  }
}
  resource "aws_subnet" "ksh_pridba" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "ksh-pridba"
  }
}
resource "aws_subnet" "ksh_pridbc" {
  vpc_id            = aws_vpc.ksh_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "ksh-pridbc"
  }
}