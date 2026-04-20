module "agent_pools" {
  source   = "./modules/agent_pools"
  for_each = var.agent_pools

  location                           = each.value.location
  name                               = each.value.name
  parent_id                          = azapi_resource.this.id
  agent_count                        = each.value.agent_count
  enable_telemetry                   = each.value.enable_telemetry
  os                                 = each.value.os
  tags                               = each.value.tags
  tier                               = each.value.tier
  virtual_network_subnet_resource_id = each.value.virtual_network_subnet_resource_id
}
