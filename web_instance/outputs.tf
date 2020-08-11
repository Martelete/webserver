output "security_groud_id" {
  value = aws_security_group.allow_http.*.id
}

output "instance_id" {
  value = aws_instance.httpd.*.id
}

output "instance_public_ip" {
  value = aws_instance.httpd.*.public_ip
}

output "instance_security_group" {
  value = aws_instance.httpd.*.security_groups
}
