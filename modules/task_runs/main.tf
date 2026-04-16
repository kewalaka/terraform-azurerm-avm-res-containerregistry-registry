resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/taskRuns@2025-03-01-preview"
  name      = var.name
  parent_id = var.parent_id
  location  = var.location
  body      = local.resource_body
  # Disabled because the body contains a discriminated object type whose
  # discriminator property value is unknown at validate time.
  schema_validation_enabled = false
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
    "properties.runResult",
    "properties.runResult.id",
    "properties.runResult.name",
    "properties.runResult.properties.logArtifact",
    "properties.runResult.properties.runErrorMessage",
    "properties.runResult.systemData",
    "properties.runResult.type",
    "systemData",
    "type"
  ]
}
