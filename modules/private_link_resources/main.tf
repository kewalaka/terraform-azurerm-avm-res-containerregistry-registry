resource "azapi_resource" "this" {
  name      = var.name
  parent_id = var.parent_id
  type      = "Microsoft.ContainerRegistry/registries/privateLinkResources@2026-01-01-preview"
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "properties",
    "properties.groupId",
    "properties.requiredMembers",
    "systemData",
    "type"
  ]
}
