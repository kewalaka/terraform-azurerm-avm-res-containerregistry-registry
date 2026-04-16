module "task_runs" {
  source   = "./modules/task_runs"
  for_each = var.task_runs

  location           = each.value.location
  name               = each.value.name
  parent_id          = azapi_resource.this.id
  enable_telemetry   = each.value.enable_telemetry
  force_update_tag   = each.value.force_update_tag
  managed_identities = each.value.managed_identities
  run_request        = each.value.run_request
}
