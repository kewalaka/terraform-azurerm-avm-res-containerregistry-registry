output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}

output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "api_version" {
  description = "The resource api version"
  value       = try(azapi_resource.this.output.apiVersion, null)
}

output "identity_principal_id" {
  description = "The principal ID of resource identity."
  value       = try(azapi_resource.this.output.identity.principalId, null)
}

output "identity_tenant_id" {
  description = "The tenant ID of resource."
  value       = try(azapi_resource.this.output.identity.tenantId, null)
}

output "creation_date" {
  description = "The creation date of the container registry in ISO8601 format."
  value       = try(azapi_resource.this.output.properties.creationDate, null)
}

output "data_endpoint_host_names" {
  description = "List of host names that will serve data when dataEndpointEnabled is true."
  value       = try(azapi_resource.this.output.properties.dataEndpointHostNames, [])
}

output "encryption_key_vault_properties_key_rotation_enabled" {
  description = "Auto key rotation status for a CMK enabled registry."
  value       = try(azapi_resource.this.output.properties.encryption.keyVaultProperties.keyRotationEnabled, null)
}

output "encryption_key_vault_properties_versioned_key_identifier" {
  description = "The fully qualified key identifier that includes the version of the key that is actually used for encryption."
  value       = try(azapi_resource.this.output.properties.encryption.keyVaultProperties.versionedKeyIdentifier, null)
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = try(azapi_resource.this.output.properties.loginServer, null)
}

output "policies_retention_policy_last_updated_time" {
  description = "The timestamp when the policy was last updated."
  value       = try(azapi_resource.this.output.properties.policies.retentionPolicy.lastUpdatedTime, null)
}

output "policies_soft_delete_policy_last_updated_time" {
  description = "The timestamp when the policy was last updated."
  value       = try(azapi_resource.this.output.properties.policies.softDeletePolicy.lastUpdatedTime, null)
}

output "private_endpoint_connections" {
  description = "List of private endpoint connections for a container registry."
  value       = try(azapi_resource.this.output.properties.privateEndpointConnections, [])
}

output "regional_endpoint_host_names" {
  description = "List of host names that will serve registry when RegionalEndpoints is enabled."
  value       = try(azapi_resource.this.output.properties.regionalEndpointHostNames, [])
}

output "status" {
  description = "The status of the container registry at the time the operation was called."
  value       = try(azapi_resource.this.output.properties.status, {})
}

output "system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.systemData, {})
}

output "type" {
  description = "The resource type"
  value       = try(azapi_resource.this.output.type, null)
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azapi_resource.this
}

output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = var.private_endpoints_manage_dns_zone_group ? azurerm_private_endpoint.this : azurerm_private_endpoint.this_unmanaged_dns_zone_groups
}

output "scope_maps" {
  description = <<DESCRIPTION
A map of scope maps. The map key is the supplied input to var.scope_maps. The map value is the entire scope map module.
DESCRIPTION
  value       = module.scope_maps
}

output "system_assigned_mi_principal_id" {
  description = "The system assigned managed identity principal ID of the parent resource."
  value       = try(azapi_resource.this.output.identity.principalId, null)
}

