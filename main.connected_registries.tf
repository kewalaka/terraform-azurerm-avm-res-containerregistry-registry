module "connected_registries" {
  source   = "./modules/connected_registries"
  for_each = var.connected_registries

  location           = each.value.location
  mode               = each.value.mode
  name               = each.value.name
  parent             = each.value.parent
  parent_id          = azapi_resource.this.id
  client_token_ids   = each.value.client_token_ids
  enable_telemetry   = each.value.enable_telemetry
  garbage_collection = each.value.garbage_collection
  logging            = each.value.logging
  notifications_list = each.value.notifications_list
}
