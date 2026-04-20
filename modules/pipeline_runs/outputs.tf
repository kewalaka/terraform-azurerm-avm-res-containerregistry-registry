output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}

output "response" {
  description = "The response of a pipeline run."
  value       = try(azapi_resource.this.output.properties.response, {})
}
