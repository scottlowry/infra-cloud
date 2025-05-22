module "lab" {
  source = "../../../../modules/resource-group"

  name = "lab-rg"
  tags = var.tags
} 