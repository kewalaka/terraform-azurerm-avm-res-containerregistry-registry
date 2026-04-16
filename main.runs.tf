module "runs" {
  source   = "./modules/runs"
  for_each = var.runs

  name      = each.value.name
  parent_id = azapi_resource.this.id
}
