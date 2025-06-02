module "rg-logs" {
  source = "../../../../modules/resource-group"

  subscription_id = var.subscription_id

  name     = "rg-logs"
  tags = {
    contents = "logs"
  }
} 