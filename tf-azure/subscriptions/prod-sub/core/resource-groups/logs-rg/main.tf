module "this" {
  source = "../../../../../modules/resource-group"

  name = "rg-logs"
  tags = var.tags
} 