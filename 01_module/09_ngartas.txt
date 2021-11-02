resource "aws_route_table_association" "ksh_ngartas_a" {
  subnet_id      = aws_subnet.ksh_pria.id
  route_table_id = aws_route_table.ksh_ngart_a.id
}
resource "aws_route_table_association" "ksh_ngartas_c" {
  subnet_id      = aws_subnet.ksh_pric.id
  route_table_id = aws_route_table.ksh_ngart_c.id
}