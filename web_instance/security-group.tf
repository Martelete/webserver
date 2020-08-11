resource "aws_security_group" "allow_http" {
  vpc_id = data.aws_vpc.vpc_id.id
  name   = "web-server-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "allow HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "allow HTTP outbound"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb_sg" {
  vpc_id = data.aws_vpc.vpc_id.id
  name   = "web-server-alb-sg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "allow HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "allow HTTP outbound"
    cidr_blocks = ["0.0.0.0/0"]
  }
}