locals {
  ingress_rules = var.ingress_rules

  egress_rules = var.egress_rules

  common_tags = {
    Environment = var.environment
    Project     = "sg-wrapper"
  }
}
