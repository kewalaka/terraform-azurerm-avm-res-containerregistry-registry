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

output "run_result" {
  description = "The result of this task run"
  value       = try(azapi_resource.this.output.properties.runResult, {})
}

output "run_result_id" {
  description = "Fully qualified resource ID for the resource. E.g. \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{resourceType}/{resourceName}\""
  value       = try(azapi_resource.this.output.properties.runResult.id, null)
}

output "run_result_name" {
  description = "The name of the resource"
  value       = try(azapi_resource.this.output.properties.runResult.name, null)
}

output "run_result_properties_log_artifact" {
  description = "The image description for the log artifact."
  value       = try(azapi_resource.this.output.properties.runResult.properties.logArtifact, {})
}

output "run_result_properties_run_error_message" {
  description = "The error message received from backend systems after the run is scheduled."
  value       = try(azapi_resource.this.output.properties.runResult.properties.runErrorMessage, null)
}

output "run_result_system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.properties.runResult.systemData, {})
}

output "run_result_type" {
  description = "The type of the resource. E.g. \"Microsoft.Compute/virtualMachines\" or \"Microsoft.Storage/storageAccounts\""
  value       = try(azapi_resource.this.output.properties.runResult.type, null)
}

output "system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.systemData, {})
}

output "type" {
  description = "The resource type"
  value       = try(azapi_resource.this.output.type, null)
}

