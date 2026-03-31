module "sg" {
  source = "./modules/sg"

  vpc_id        = var.vpc_id
  ingress_rules = local.ingress_rules
  egress_rules  = local.egress_rules
  tags          = local.common_tags
}
