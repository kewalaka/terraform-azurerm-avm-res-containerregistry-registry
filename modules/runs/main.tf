resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/runs@2025-03-01-preview"
  name      = var.name
  parent_id = var.parent_id
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
