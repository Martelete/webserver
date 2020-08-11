data "aws_vpc" "vpc_id" {
  filter {
    name   = "tag:Name"
    values = ["default_vpc"]
  }
}

data "aws_subnet" "subnet_id" {
  filter {
    name   = "tag:Name"
    values = ["subnet-public-b"]
  }
}

data "aws_subnet" "subnet_id_a" {
  filter {
    name   = "tag:Name"
    values = ["subnet-public-a"]
  }
}

data "aws_subnet" "subnet_id_b" {
  filter {
    name   = "tag:Name"
    values = ["subnet-public-b"]
  }
}

data "aws_subnet" "subnet_id_c" {
  filter {
    name   = "tag:Name"
    values = ["subnet-public-c"]
  }
}

# Alternative way by putting the values directly

# data "aws_vpc" "vpc_id" {
#   id = ""
# }

# data "aws_subnet" "subnet_id" {
#   id = ""
# }