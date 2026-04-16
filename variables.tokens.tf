variable "tokens" {
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**credentials**
The credentials that can be used for authenticating the token.

- `certificates` - The certificates property.
- `passwords` - The passwords property.


**scope_map_id**
The resource ID of the scope map to which the token will be associated with.

**status**
The status of the token example enabled or disabled.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type = map(object({
    credentials = optional(object({
      certificates = optional(list(object({
        encoded_pem_certificate = optional(string)
        expiry                  = optional(string)
        name                    = optional(any)
        thumbprint              = optional(string)
      })))
      passwords = optional(list(object({
        creation_time = optional(string)
        expiry        = optional(string)
        name          = optional(any)
      })))
    }))
    enable_telemetry = optional(bool)
    location         = string
    name             = string
    scope_map_id     = optional(string)
    status           = optional(any)
  }))
  default = {}
}
