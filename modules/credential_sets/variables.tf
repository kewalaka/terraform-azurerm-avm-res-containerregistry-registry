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

variable "auth_credentials" {
  type = list(object({
    name                       = optional(any)
    password_secret_identifier = optional(string)
    username_secret_identifier = optional(string)
  }))
  default     = null
  description = <<DESCRIPTION
List of authentication credentials stored for an upstream.
Usually consists of a primary and an optional secondary credential.
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

variable "login_server" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The credentials are stored for this upstream or login server.
DESCRIPTION
}

# tflint-ignore: terraform_unused_declarations
variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource.
DESCRIPTION
  nullable    = false
}
