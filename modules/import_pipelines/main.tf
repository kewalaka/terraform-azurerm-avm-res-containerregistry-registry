resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/importPipelines@2026-01-01-preview"
  name      = var.name
  parent_id = var.parent_id
  location  = var.location
  body      = local.resource_body
  dynamic "identity" {
    for_each = local.managed_identities.system_assigned_user_assigned
    content {
      type         = identity.value.type
      identity_ids = identity.value.user_assigned_resource_ids
    }
  }
  response_export_values = [
    "apiVersion",
    "identity.principalId",
    "identity.tenantId",
    "systemData",
    "type"
  ]
}
