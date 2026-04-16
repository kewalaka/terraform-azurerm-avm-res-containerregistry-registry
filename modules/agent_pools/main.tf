resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/agentPools@2025-03-01-preview"
  name      = var.name
  parent_id = var.parent_id
  location  = var.location
  body      = local.resource_body
  tags      = var.tags
  response_export_values = [
    "apiVersion",
    "systemData",
    "type"
  ]
}
