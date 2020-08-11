resource "aws_s3_bucket" "web_server_s3_alb_logs" {
  bucket = "web-server-s3-alb-logs"
  acl    = "private"
  tags   = local.tags

  versioning {
    enabled = true
  }
}