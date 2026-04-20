locals {
  resource_body = {
    properties = {
      regionEndpointEnabled = var.region_endpoint_enabled
      zoneRedundancy        = var.zone_redundancy
    }
  }
}
