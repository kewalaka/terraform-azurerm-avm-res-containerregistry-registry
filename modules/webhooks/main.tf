resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/webhooks@2026-01-01-preview"
  name      = var.name
  parent_id = var.parent_id
  location  = var.location
  body      = local.resource_body
  sensitive_body = {
    properties = {
      customHeaders = var.custom_headers
      serviceUri    = var.service_uri
    }
  }
  sensitive_body_version = {
    "properties.customHeaders" = var.custom_headers_version
    "properties.serviceUri"    = var.service_uri_version
  }
  tags = var.tags
  response_export_values = [
    "apiVersion",
    "systemData",
    "type"
  ]
}
