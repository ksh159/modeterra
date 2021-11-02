resource "aws_placement_group" "ksh_pg" {
  name = "ksh-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "ksh_atsg" {
  name = "ksh-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.ksh_lacf.name
  vpc_zone_identifier       = [aws_subnet.ksh_puba.id,aws_subnet.ksh_pubc.id]
}