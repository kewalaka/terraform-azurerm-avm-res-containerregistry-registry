module "pipeline_runs" {
  source   = "./modules/pipeline_runs"
  for_each = var.pipeline_runs

  location         = each.value.location
  name             = each.value.name
  parent_id        = azapi_resource.this.id
  enable_telemetry = each.value.enable_telemetry
  force_update_tag = each.value.force_update_tag
  request          = each.value.request
}
