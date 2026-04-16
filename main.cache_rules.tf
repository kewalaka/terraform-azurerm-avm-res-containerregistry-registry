module "cache_rules" {
  source                     = "./modules/cache_rules"
  for_each                   = var.cache_rules
  credential_set_resource_id = each.value.credential_set_resource_id
  enable_telemetry           = each.value.enable_telemetry
  location                   = each.value.location
  managed_identities         = each.value.managed_identities
  name                       = each.value.name
  parent_id                  = azapi_resource.this.id
  source_repository          = each.value.source_repository
  target_repository          = each.value.target_repository
}
