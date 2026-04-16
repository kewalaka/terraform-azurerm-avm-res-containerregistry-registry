variable "cache_rules" {
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**source_repository**
Source repository pulled from upstream.

**target_repository**
Target repository specified in docker pull command.
Eg: docker pull myregistry.azurecr.io/{targetRepository}:{tag}

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**name**
The name of the resource.

**location**
The location of the resource.

**managed_identities**
Controls the Managed Identity configuration on this resource.

**credential_set_resource_id**
The ARM resource ID of the credential store which is associated with the cache rule.
DESCRIPTION
  type = map(object({
    credential_set_resource_id = optional(string)
    enable_telemetry           = optional(bool)
    location                   = string
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name              = string
    source_repository = optional(string)
    target_repository = optional(string)
  }))
  default = {}
}
