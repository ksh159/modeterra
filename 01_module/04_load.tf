# Application LoadBalncer Deploy
resource "aws_lb" "ksh_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ksh_websg.id]
  subnets            = [aws_subnet.ksh_pub[0].id,aws_subnet.ksh_pub[1].id]
 /*
    s3버킷에 로그저장
    access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }  */
  tags = {
    Name = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "ksh_lbtg" {
  name = "${var.name}-lbtg"
  port = var.http_port
  protocol = var.prot_HTTP
  vpc_id = aws_vpc.ksh_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = var.prot_HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "front_end" {
    load_balancer_arn       = aws_lb.ksh_lb.arn
    port                    = var.http_port
    protocol                = var.prot_HTTP

    default_action {
      type          = "forward"
      target_group_arn = aws_lb_target_group.ksh_lbtg.arn
    }
}

resource "aws_lb_target_group_attachment" "ksh_lbtg_att" {
  target_group_arn = aws_lb_target_group.ksh_lbtg.arn
  target_id = aws_instance.ksh_web.id
  port = var.http_port
}