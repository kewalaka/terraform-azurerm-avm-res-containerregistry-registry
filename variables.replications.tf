variable "replications" {
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**tags**
(Optional) Tags of the resource.

**region_endpoint_enabled**
Specifies whether the replication's regional endpoint is enabled. Requests will not be routed to a replication whose regional endpoint is disabled, however its data will continue to be synced with other replications.

**zone_redundancy**
Whether or not zone redundancy is enabled for this container registry replication

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type = map(object({
    enable_telemetry        = optional(bool)
    location                = string
    name                    = string
    region_endpoint_enabled = optional(bool)
    tags                    = optional(map(string))
    zone_redundancy         = optional(any)
  }))
  default = {}
}
