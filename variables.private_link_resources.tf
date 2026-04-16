variable "private_link_resources" {
  type = map(object({
    enable_telemetry    = optional(bool)
    location            = string
    name                = string
    required_zone_names = optional(list(string))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of private link resource instances for the container registry with the following attributes:

**name**
The name of the private link resource.

**location**
The location of the resource.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**required_zone_names**
The private link resource private link DNS zone name.
DESCRIPTION
}
