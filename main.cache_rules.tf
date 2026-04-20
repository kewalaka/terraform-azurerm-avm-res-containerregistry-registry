module "cache_rules" {
  source   = "./modules/cache_rules"
  for_each = var.cache_rules

  location                   = each.value.location
  name                       = each.value.name
  parent_id                  = azapi_resource.this.id
  credential_set_resource_id = each.value.credential_set_resource_id
  enable_telemetry           = each.value.enable_telemetry
  managed_identities         = each.value.managed_identities
  source_repository          = each.value.source_repository
  target_repository          = each.value.target_repository
}
