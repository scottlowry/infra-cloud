module "rg-apps" {
  source = "../../../../modules/resource-group"

  subscription_id = var.subscription_id

  name = "rg-apps"
  tags = {
    contents = "apps"
  }
} 