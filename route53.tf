# resource "aws_route53_zone" "public_zone" {
#   name = "martelete.site"

# }

# resource "aws_route53_record" "httpd_record" {
#   zone_id = aws_route53_zone.public_zone.zone_id
#   name    = "test"
#   type    = "A"
#   ttl     = "60"
#   records = [aws_instance.httpd.public_ip]
# }