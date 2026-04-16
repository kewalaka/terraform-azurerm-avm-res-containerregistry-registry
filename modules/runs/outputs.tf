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

output "log_artifact" {
  description = "The image description for the log artifact."
  value       = try(azapi_resource.this.output.properties.logArtifact, {})
}

output "run_error_message" {
  description = "The error message received from backend systems after the run is scheduled."
  value       = try(azapi_resource.this.output.properties.runErrorMessage, null)
}

output "system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.systemData, {})
}

output "type" {
  description = "The resource type"
  value       = try(azapi_resource.this.output.type, null)
}

