module "private_link_resources" {
  source   = "./modules/private_link_resources"
  for_each = var.private_link_resources

  location            = each.value.location
  name                = each.value.name
  parent_id           = azapi_resource.this.id
  enable_telemetry    = each.value.enable_telemetry
  required_zone_names = each.value.required_zone_names
}
