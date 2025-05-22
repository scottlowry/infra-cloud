module "this" {
  source = "../../../../../modules/resource-group"

  name = "rg-apps"
  tags = var.tags
} 