resource "aws_db_instance" "ksh_mydb" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  identifier              = "mydb"
  username                = "admin"
  password                = "It12345!"
  parameter_group_name    = "default.mysql8.0"
  availability_zone       = "ap-northeast-2a"
  db_subnet_group_name    = aws_db_subnet_group.ksh_dbsn.id
  vpc_security_group_ids  = [aws_security_group.ksh_websg.id]
  skip_final_snapshot     = true
  tags = {
      Name = "ksh-mydb"
  }
}

resource "aws_db_subnet_group" "ksh_dbsn" {
  name  =   "ksh-dbsb-group"
  subnet_ids = [aws_subnet.ksh_pridba.id,aws_subnet.ksh_pridbc.id]
  tags = {
      Name = "ksh-dbsb-group"
  }
}