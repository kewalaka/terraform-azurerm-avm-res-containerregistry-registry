module "task_runs" {
  source   = "./modules/task_runs"
  for_each = var.task_runs

  enable_telemetry   = each.value.enable_telemetry
  force_update_tag   = each.value.force_update_tag
  location           = each.value.location
  managed_identities = each.value.managed_identities
  name               = each.value.name
  parent_id          = azapi_resource.this.id
  run_request        = each.value.run_request
}
