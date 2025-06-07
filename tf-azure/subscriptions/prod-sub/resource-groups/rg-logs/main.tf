module "rg-logs" {
  source = "../../../../modules/resource-group"

  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret

  name     = "rg-logs"
  tags = {
    contents = "logs"
  }
} 