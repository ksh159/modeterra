resource "aws_ami_from_instance" "ksh_ami" {
    name                = "${var.name}-ami"
    source_instance_id  = aws_instance.ksh_web.id  
}

resource "aws_launch_configuration" "ksh_lacf" {
  name = "${var.name}-web"
  image_id = aws_ami_from_instance.ksh_ami.id
  instance_type = var.instance
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.ksh_websg.id]
  key_name = var.key
  user_data =<<-EOF
            #!/bin/bash
            systemctl start httpd
            systemctl enable httpd
            EOF
  lifecycle {
      create_before_destroy = true
    }
}


resource "aws_placement_group" "ksh_pg" {
  name = "${var.name}-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "ksh_atsg" {
  name = "${var.name}-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.ksh_lacf.name
  vpc_zone_identifier       = [aws_subnet.ksh_pub[0].id,aws_subnet.ksh_pub[1].id]
}

resource "aws_autoscaling_attachment" "ksh_attat" {
  autoscaling_group_name = aws_autoscaling_group.ksh_atsg.id
  alb_target_group_arn = aws_lb_target_group.ksh_lbtg.arn
} 

