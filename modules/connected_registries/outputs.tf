output "activation" {
  description = "The activation properties of the connected registry."
  value       = try(azapi_resource.this.output.properties.activation, {})
}

output "api_version" {
  description = "The resource api version"
  value       = try(azapi_resource.this.output.apiVersion, null)
}

output "last_activity_time" {
  description = "The last activity time of the connected registry."
  value       = try(azapi_resource.this.output.properties.lastActivityTime, null)
}

output "login_server_host" {
  description = "The host of the connected registry. Can be FQDN or IP."
  value       = try(azapi_resource.this.output.properties.loginServer.host, null)
}

output "login_server_tls" {
  description = "The TLS properties of the connected registry login server."
  value       = try(azapi_resource.this.output.properties.loginServer.tls, {})
}

output "login_server_tls_certificate" {
  description = "The certificate used to configure HTTPS for the login server."
  value       = try(azapi_resource.this.output.properties.loginServer.tls.certificate, {})
}

output "login_server_tls_certificate_location" {
  description = "Indicates the location of the certificates."
  value       = try(azapi_resource.this.output.properties.loginServer.tls.certificate.location, null)
}

output "name" {
  description = "The name of the created resource."
  value       = azapi_resource.this.name
}

output "parent_sync_properties_gateway_endpoint" {
  description = "The gateway endpoint used by the connected registry to communicate with its parent."
  value       = try(azapi_resource.this.output.properties.parent.syncProperties.gatewayEndpoint, null)
}

output "parent_sync_properties_last_sync_time" {
  description = "The last time a sync occurred between the connected registry and its parent."
  value       = try(azapi_resource.this.output.properties.parent.syncProperties.lastSyncTime, null)
}

output "resource_id" {
  description = "The ID of the created resource."
  value       = azapi_resource.this.id
}

output "status_details" {
  description = "The list of current statuses of the connected registry."
  value       = try(azapi_resource.this.output.properties.statusDetails, [])
}

output "system_data" {
  description = "Azure Resource Manager metadata containing createdBy and modifiedBy information."
  value       = try(azapi_resource.this.output.systemData, {})
}

output "type" {
  description = "The resource type"
  value       = try(azapi_resource.this.output.type, null)
}

output "version" {
  description = "The current version of ACR runtime on the connected registry."
  value       = try(azapi_resource.this.output.properties.version, null)
}
