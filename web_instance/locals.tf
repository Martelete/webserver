locals {
  tags = {
    OS       = "Linux2"
    Build_by = "Managed by Terraform"
    Name     = "Apache httpd"
  }

  asg = [ 
    {
      key                 = "Creator"
      value               = "Terraform"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = "web_server_http"
      propagate_at_launch = true
    }
  ]
}