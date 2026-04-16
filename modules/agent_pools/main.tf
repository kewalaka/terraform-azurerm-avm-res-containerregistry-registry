resource "azapi_resource" "this" {
  location  = var.location
  name      = var.name
  parent_id = var.parent_id
  type      = "Microsoft.ContainerRegistry/registries/agentPools@2025-03-01-preview"
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "systemData",
    "type"
  ]
  tags = var.tags
}
