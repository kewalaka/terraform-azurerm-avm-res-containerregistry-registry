resource "azapi_resource" "this" {
  type      = "Microsoft.ContainerRegistry/registries/connectedRegistries@2026-01-01-preview"
  name      = var.name
  parent_id = var.parent_id
  body      = local.resource_body
  response_export_values = [
    "apiVersion",
    "properties.activation",
    "properties.lastActivityTime",
    "properties.loginServer.host",
    "properties.loginServer.tls",
    "properties.loginServer.tls.certificate",
    "properties.loginServer.tls.certificate.location",
    "properties.parent.syncProperties.gatewayEndpoint",
    "properties.parent.syncProperties.lastSyncTime",
    "properties.statusDetails",
    "properties.version",
    "systemData",
    "type"
  ]
}
