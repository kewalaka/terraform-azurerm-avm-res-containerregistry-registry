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

# tflint-ignore: terraform_unused_declarations
variable "managed_identities" {
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource.
DESCRIPTION
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default  = {}
  nullable = false
}

variable "credential_set_resource_id" {
  description = <<DESCRIPTION
The ARM resource ID of the credential store which is associated with the cache rule.
DESCRIPTION
  type        = string
  default     = null
}

variable "source_repository" {
  description = <<DESCRIPTION
Source repository pulled from upstream.
DESCRIPTION
  type        = string
  default     = null
}

variable "target_repository" {
  description = <<DESCRIPTION
Target repository specified in docker pull command.
Eg: docker pull myregistry.azurecr.io/{targetRepository}:{tag}
DESCRIPTION
  type        = string
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

