module "tasks" {
  source   = "./modules/tasks"
  for_each = var.tasks

  agent_configuration = each.value.agent_configuration
  agent_pool_name     = each.value.agent_pool_name
  credentials         = each.value.credentials
  enable_telemetry    = each.value.enable_telemetry
  is_system_task      = each.value.is_system_task
  location            = each.value.location
  log_template        = each.value.log_template
  managed_identities  = each.value.managed_identities
  name                = each.value.name
  parent_id           = azapi_resource.this.id
  platform            = each.value.platform
  status              = each.value.status
  step                = each.value.step
  tags                = each.value.tags
  timeout             = each.value.timeout
  trigger             = each.value.trigger
}
