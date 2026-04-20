module "tokens" {
  source   = "./modules/tokens"
  for_each = var.tokens

  location         = each.value.location
  name             = each.value.name
  parent_id        = azapi_resource.this.id
  credentials      = each.value.credentials
  enable_telemetry = each.value.enable_telemetry
  scope_map_id     = each.value.scope_map_id
  status           = each.value.status

  depends_on = [module.scope_maps]
}
