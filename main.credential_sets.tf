module "credential_sets" {
  source   = "./modules/credential_sets"
  for_each = var.credential_sets

  location           = each.value.location
  name               = each.value.name
  parent_id          = azapi_resource.this.id
  auth_credentials   = each.value.auth_credentials
  enable_telemetry   = each.value.enable_telemetry
  login_server       = each.value.login_server
  managed_identities = each.value.managed_identities
}
