output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}

output "status" {
  description = "The status of the replication at the time the operation was called."
  value       = try(azapi_resource.this.output.properties.status, {})
}
