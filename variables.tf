variable "vpc_id" {
  type        = string
  description = "The VPC ID where the security group will be created."
}

variable "environment" {
  type        = string
  description = "Environment name (e.g. dev, staging, prod)."
}

variable "ingress_rules" {
  description = "List of ingress rules to apply to the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules to apply to the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
