resource "aws_lb_target_group_attachment" "ksh_lbtg_att" {
  target_group_arn = aws_lb_target_group.ksh_lbtg.arn
  target_id = aws_instance.ksh_weba.id
  port = 80
}