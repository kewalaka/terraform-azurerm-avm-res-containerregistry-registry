resource "azapi_resource" "this" {
  location  = var.location
  name      = var.name
  parent_id = var.parent_id
  type      = "Microsoft.ContainerRegistry/registries/tasks@2025-03-01-preview"
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "identity.principalId",
    "identity.tenantId",
    "properties.creationDate",
    "properties.step.baseImageDependencies",
    "systemData",
    "type"
  ]
  # Disabled because the body contains a discriminated object type whose
  # discriminator property value is unknown at validate time.
  schema_validation_enabled = false
  tags                      = var.tags

  dynamic "identity" {
    for_each = local.managed_identities.system_assigned_user_assigned

    content {
      type         = identity.value.type
      identity_ids = identity.value.user_assigned_resource_ids
    }
  }
}
