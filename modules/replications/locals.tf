locals {
  resource_body = {
    name = var.name
    properties = {
      regionEndpointEnabled = var.region_endpoint_enabled
      zoneRedundancy        = var.zone_redundancy
    }
    tags = var.tags == null ? null : { for k, value in var.tags : k => value }
  }
}
