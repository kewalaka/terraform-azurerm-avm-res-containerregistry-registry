variable "connected_registries" {
  type = map(object({
    client_token_ids = optional(list(string))
    enable_telemetry = optional(bool)
    garbage_collection = optional(object({
      enabled  = optional(bool)
      schedule = optional(string)
    }))
    location = string
    logging = optional(object({
      audit_log_status = optional(any)
      log_level        = optional(any)
    }))
    mode               = any
    name               = string
    notifications_list = optional(list(string))
    parent = object({
      id = optional(string)
      sync_properties = object({
        message_ttl = string
        schedule    = optional(string)
        sync_window = optional(string)
        token_id    = string
      })
    })
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**mode**
The mode of the connected registry resource that indicates the permissions of the registry.

**parent**
The parent of the connected registry.

**client_token_ids**
The list of the ACR token resource IDs used to authenticate clients to the connected registry.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**garbage_collection**
The garbage collection properties of the connected registry.

**logging**
The logging properties of the connected registry.

**notifications_list**
The list of notifications subscription information for the connected registry.

DESCRIPTION
}
