module "rg-apps" {
  source = "../../../../modules/resource-group"

  name     = "rg-apps"
  tags     = merge(var.tags, {
    resource_group_contents = "apps"
  })
} 