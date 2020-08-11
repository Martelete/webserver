resource "aws_launch_configuration" "web_server_lc" {
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
  launch_configuration      = aws_launch_configuration.web_server_lc.name
  # vpc_zone_identifier       = [data.aws_subnet.subnet_id_a.id, data.aws_subnet.subnet_id_b.id, data.aws_subnet.subnet_id_c.id] 
  vpc_zone_identifier       = sort(data.aws_subnet.subnet_id.*.id)
  tags                      = local.asg
}