resource "aws_lb" "web-server-alb" {
  name               = "public-alb-web-server"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.subnet_id.id]
  tags               = local.tags

  access_logs {
    bucket  = aws_s3_bucket.web_server_s3_alb_logs.bucket
    prefix  = "alb-logs"
    enabled = true
  }
}

resource "aws_lb_listener" "public_facing" {
  load_balancer_arn = aws_lb.web-server-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server_tg.arn
  }
}

resource "aws_lb_target_group" "web_server_tg" {
  name     = "web-server-default"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc_id.id

  health_check {
    enabled             = true
    path                = "/_system/ping"
    matcher             = 200
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
    protocol            = "HTTP"
  }
}