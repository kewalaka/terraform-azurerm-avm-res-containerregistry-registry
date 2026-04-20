module "export_pipelines" {
  source   = "./modules/export_pipelines"
  for_each = var.export_pipelines

  location           = each.value.location
  name               = each.value.name
  parent_id          = azapi_resource.this.id
  target             = each.value.target
  enable_telemetry   = each.value.enable_telemetry
  managed_identities = each.value.managed_identities
  options            = each.value.options
}
