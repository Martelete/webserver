variable region {}

variable ami_id {}

variable key_pair {}

variable instance_type {}

variable instances {}

variable "endpoint" {
  description = "LocalStack endpoint URL for AWS services"
  type        = string
  default     = "http://localhost:4566"
}

