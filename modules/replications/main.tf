resource "azapi_resource" "this" {
  location  = var.location
  name      = var.name
  parent_id = var.parent_id
  type      = "Microsoft.ContainerRegistry/registries/replications@2026-01-01-preview"
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "properties.status",
    "systemData",
    "type"
  ]
  tags = var.tags
}
