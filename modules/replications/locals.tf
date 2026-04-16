locals {
  resource_body = {
    name = var.name
    properties = {
      regionEndpointEnabled = var.region_endpoint_enabled
      zoneRedundancy        = var.zone_redundancy
    }
  }
}
