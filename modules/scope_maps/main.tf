resource "azapi_resource" "this" {
  name                   = var.name
  parent_id              = var.parent_id
  type                   = "Microsoft.ContainerRegistry/registries/scopeMaps@2026-01-01-preview"
  body                   = local.resource_body
  response_export_values = []
}

moved {
  from = azurerm_container_registry_scope_map.this
  to   = azapi_resource.this
}
