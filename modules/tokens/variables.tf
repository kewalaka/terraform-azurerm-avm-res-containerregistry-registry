variable "location" {
  type        = string
  description = <<DESCRIPTION
The location of the resource.
DESCRIPTION
}

variable "name" {
  type        = string
  description = <<DESCRIPTION
The name of the resource.
DESCRIPTION
}

variable "parent_id" {
  type        = string
  description = <<DESCRIPTION
The parent resource ID for this resource.
DESCRIPTION
}

variable "credentials" {
  type = object({
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
  })
  default     = null
  description = <<DESCRIPTION
The credentials that can be used for authenticating the token.

- `certificates` - The certificates property.
- `passwords` - The passwords property.

DESCRIPTION
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  nullable    = false
}

variable "scope_map_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The resource ID of the scope map to which the token will be associated with.
DESCRIPTION
}

variable "status" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The status of the token example enabled or disabled.
DESCRIPTION
}
