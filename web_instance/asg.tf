resource "aws_launch_template" "web_server_lc" {
  name                 = "web_server_httpd"
  image_id             = var.ami_id
  instance_type        = "t2.micro"
  # iam_instance_profile = ""
    
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_server" {
  name                      = "web_server_auto_scaling"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true

  launch_template {
    id      = aws_launch_template.web_server_lc.id
    version = "$Latest"
  }
  
  target_group_arns = [
    aws_lb_target_group.web_server_tg.arn
  ]
  
  vpc_zone_identifier       = sort(data.aws_subnet.subnet_id.*.id)
  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }               
}