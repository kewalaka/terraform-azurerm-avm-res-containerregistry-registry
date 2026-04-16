resource "azapi_resource" "this" {
  name      = var.name
  parent_id = var.parent_id
  type      = "Microsoft.ContainerRegistry/registries/runs@2025-03-01-preview"
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "properties",
    "properties.logArtifact",
    "properties.runErrorMessage",
    "systemData",
    "type"
  ]
}
