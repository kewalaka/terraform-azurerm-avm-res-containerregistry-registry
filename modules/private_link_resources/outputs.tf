output "api_version" {
  description = "The resource api version"
  value       = try(azapi_resource.this.output.apiVersion, null)
}

output "group_id" {
  description = "The private link resource group id."
  value       = try(azapi_resource.this.output.properties.groupId, null)
}

output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "required_members" {
  description = "The private link resource required member names."
  value       = try(azapi_resource.this.output.properties.requiredMembers, [])
}

output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}

output "system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.systemData, {})
}

output "type" {
  description = "The resource type"
  value       = try(azapi_resource.this.output.type, null)
}
