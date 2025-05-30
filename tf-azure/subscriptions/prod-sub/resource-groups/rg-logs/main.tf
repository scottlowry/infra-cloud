module "rg-logs" {
  source = "../../../../modules/resource-group"

  name     = "rg-logs"
  tags     = merge(var.tags, {
    resource_group_contents = "logs"
  })
} 