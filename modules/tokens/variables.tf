variable "name" {
  description = <<DESCRIPTION
The name of the resource.
DESCRIPTION
  type        = string
}

variable "parent_id" {
  description = <<DESCRIPTION
The parent resource ID for this resource.
DESCRIPTION
  type        = string
}

variable "location" {
  description = <<DESCRIPTION
The location of the resource.
DESCRIPTION
  type        = string
}

variable "credentials" {
  description = <<DESCRIPTION
The credentials that can be used for authenticating the token.

- `certificates` - The certificates property.
- `passwords` - The passwords property.

DESCRIPTION
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
  default = null
}

variable "scope_map_id" {
  description = <<DESCRIPTION
The resource ID of the scope map to which the token will be associated with.
DESCRIPTION
  type        = string
  default     = null
}

variable "status" {
  description = <<DESCRIPTION
The status of the token example enabled or disabled.
DESCRIPTION
  type        = any
  default     = null
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

