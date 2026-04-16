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

variable "credential_set_resource_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The ARM resource ID of the credential store which is associated with the cache rule.
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

variable "source_repository" {
  type        = string
  default     = null
  description = <<DESCRIPTION
Source repository pulled from upstream.
DESCRIPTION
}

variable "target_repository" {
  type        = string
  default     = null
  description = <<DESCRIPTION
Target repository specified in docker pull command.
Eg: docker pull myregistry.azurecr.io/{targetRepository}:{tag}
DESCRIPTION
}
