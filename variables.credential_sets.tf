variable "credential_sets" {
  type = map(object({
    auth_credentials = optional(list(object({
      name                       = optional(any)
      password_secret_identifier = optional(string)
      username_secret_identifier = optional(string)
    })))
    enable_telemetry = optional(bool)
    location         = string
    login_server     = optional(string)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name = string
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**auth_credentials**
List of authentication credentials stored for an upstream.
Usually consists of a primary and an optional secondary credential.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**login_server**
The credentials are stored for this upstream or login server.

**managed_identities**
Controls the Managed Identity configuration on this resource.
DESCRIPTION
}
