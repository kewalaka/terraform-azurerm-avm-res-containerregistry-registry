module "webhooks" {
  source                 = "./modules/webhooks"
  for_each               = var.webhooks
  actions                = each.value.actions
  custom_headers         = each.value.custom_headers
  custom_headers_version = each.value.custom_headers_version
  enable_telemetry       = each.value.enable_telemetry
  location               = each.value.location
  name                   = each.value.name
  parent_id              = azapi_resource.this.id
  scope                  = each.value.scope
  service_uri            = each.value.service_uri
  service_uri_version    = each.value.service_uri_version
  status                 = each.value.status
  tags                   = each.value.tags
}
