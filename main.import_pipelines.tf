module "import_pipelines" {
  source   = "./modules/import_pipelines"
  for_each = var.import_pipelines

  location           = each.value.location
  name               = each.value.name
  parent_id          = azapi_resource.this.id
  pipeline_source    = each.value.pipeline_source
  enable_telemetry   = each.value.enable_telemetry
  managed_identities = each.value.managed_identities
  options            = each.value.options
  trigger            = each.value.trigger
}
