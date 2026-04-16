resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/replications@2026-01-01-preview"
  name      = var.name
  parent_id = var.parent_id
  location  = var.location
  body      = local.resource_body
  tags      = var.tags
  response_export_values = [
    "apiVersion",
    "properties.status",
    "systemData",
    "type"
  ]
}
