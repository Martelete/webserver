resource "aws_instance" "httpd" {
  count             = var.instances
  tags              = local.tags
  ami               = var.ami_id
  key_name          = var.key_pair
  instance_type     = var.instance_type
  subnet_id         = data.aws_subnet.subnet_id.id
  #   subnet_id 	              = sort(data.aws_subnet_ids.subnet_id.ids)[0]  // in case HA
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  user_data_base64            = base64encode(file("${path.module}/userdata/user_data.sh"))
  associate_public_ip_address = true
}