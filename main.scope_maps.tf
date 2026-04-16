module "scope_maps" {
  source           = "./modules/scope_maps"
  for_each         = var.scope_maps
  actions          = each.value.actions
  description      = each.value.description
  enable_telemetry = each.value.enable_telemetry
  location         = each.value.location
  name             = each.value.name
  parent_id        = azapi_resource.this.id
}
