locals {
  resource_body = {
    properties = {
      count                          = var.agent_count
      os                             = var.os
      tier                           = var.tier
      virtualNetworkSubnetResourceId = var.virtual_network_subnet_resource_id
    }
  }
}
