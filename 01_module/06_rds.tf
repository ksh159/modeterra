resource "aws_db_instance" "ksh_mydb" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instancedb
  name                    = var.dbname
  identifier              = var.dbname
  username                = "admin"
  password                = "It12345!"
  parameter_group_name    = "default.mysql8.0"
  availability_zone       = "${var.region}${var.avazone[0]}"
  db_subnet_group_name    = aws_db_subnet_group.ksh_dbsn.id
  vpc_security_group_ids  = [aws_security_group.ksh_websg.id]
  skip_final_snapshot     = true
  tags = {
      Name = "${var.name}-mydb"
  }
}

resource "aws_db_subnet_group" "ksh_dbsn" {
  name  =   "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.ksh_pridb[0].id,aws_subnet.ksh_pridb[1].id]
  tags = {
      Name = "${var.name}-dbsb-group"
  }
}