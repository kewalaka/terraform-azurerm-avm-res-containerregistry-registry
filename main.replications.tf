module "replications" {
  source   = "./modules/replications"
  for_each = var.replications

  location                = each.value.location
  name                    = each.value.name
  parent_id               = azapi_resource.this.id
  enable_telemetry        = each.value.enable_telemetry
  region_endpoint_enabled = each.value.region_endpoint_enabled
  tags                    = each.value.tags
  zone_redundancy         = each.value.zone_redundancy
}
