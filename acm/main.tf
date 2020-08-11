resource "aws_acm_certificate" "cert" {
  domain_name       = "*.martelete.site"
  validation_method = "DNS"

  tags = {
    Name = "web-server"
  }

  lifecycle {
    create_before_destroy = true
  }
}