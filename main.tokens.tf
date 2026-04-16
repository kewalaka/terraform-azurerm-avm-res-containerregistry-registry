module "tokens" {
  source           = "./modules/tokens"
  for_each         = var.tokens
  credentials      = each.value.credentials
  enable_telemetry = each.value.enable_telemetry
  location         = each.value.location
  name             = each.value.name
  parent_id        = azapi_resource.this.id
  scope_map_id     = each.value.scope_map_id
  status           = each.value.status
}
