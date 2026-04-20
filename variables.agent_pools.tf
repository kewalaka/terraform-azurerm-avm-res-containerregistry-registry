variable "agent_pools" {
  type = map(object({
    agent_count                        = optional(number)
    enable_telemetry                   = optional(bool)
    location                           = string
    name                               = string
    os                                 = optional(any)
    tags                               = optional(map(string))
    tier                               = optional(string)
    virtual_network_subnet_resource_id = optional(string)
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**agent_count**
The count of agent machine.

**os**
The OS of agent machine.

**tier**
The Tier of agent machine.

**virtual_network_subnet_resource_id**
The Virtual Network Subnet Resource Id of the agent machine.

**tags**
(Optional) Tags of the resource.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
}
