output "identity_principal_id" {
  description = "The principal ID of resource identity."
  value       = try(azapi_resource.this.output.identity.principalId, null)
}

output "identity_tenant_id" {
  description = "The tenant ID of resource."
  value       = try(azapi_resource.this.output.identity.tenantId, null)
}

output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}
