variable "sku" {
  type = object({
    name = any
  })
  description = <<DESCRIPTION
The SKU of the container registry.

- `name` - The SKU name of the container registry. Required for registry creation.

DESCRIPTION
}

variable "admin_user_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
The value that indicates whether the admin user is enabled.
DESCRIPTION
}

variable "anonymous_pull_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
Enables registry-wide pull from unauthenticated clients.
DESCRIPTION
}

variable "auto_generated_domain_name_label_scope" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Determines the domain name label reuse scope.
DESCRIPTION
}

variable "data_endpoint_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
Enable a single data endpoint per region for serving data.
DESCRIPTION
}

variable "encryption" {
  type = object({
    key_vault_properties = optional(object({
      identity       = optional(string)
      key_identifier = optional(string)
    }))
    status = optional(any)
  })
  default     = null
  description = <<DESCRIPTION
The encryption settings of container registry.

- `key_vault_properties` - Key vault properties.
  - `identity` - The client id of the identity which will be used to access key vault.
  - `key_identifier` - Key vault uri to access the encryption key.
- `status` - Indicates whether or not the encryption is enabled for container registry.

DESCRIPTION
}

variable "endpoint_protocol" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The connectivity protocol for the registry, such as IPv4 or dual stack (IPv4 and IPv6).
DESCRIPTION
}

variable "metadata_search" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Determines whether registry artifacts are indexed for metadata search.
DESCRIPTION
}

variable "network_rule_bypass_allowed_for_tasks" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
Whether or not Tasks allowed to bypass the network rules for this container registry.
DESCRIPTION
}

variable "network_rule_bypass_options" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Whether to allow trusted Azure services to access a network restricted registry.
DESCRIPTION
}

variable "network_rule_set" {
  type = object({
    default_action = any
    ip_rules = optional(list(object({
      action = optional(any)
      value  = string
    })))
  })
  default     = null
  description = <<DESCRIPTION
The network rule set for a container registry.

- `default_action` - The default action of allow or deny when no other rules match.
- `ip_rules` - The IP ACL rules.

DESCRIPTION
}

variable "policies" {
  type = object({
    azure_ad_authentication_as_arm_policy = optional(object({
      status = optional(any)
    }))
    export_policy = optional(object({
      status = optional(any)
    }))
    quarantine_policy = optional(object({
      status = optional(any)
    }))
    retention_policy = optional(object({
      days   = optional(number)
      status = optional(any)
    }))
    soft_delete_policy = optional(object({
      retention_days = optional(number)
      status         = optional(any)
    }))
    trust_policy = optional(object({
      status = optional(any)
      type   = optional(any)
    }))
  })
  default     = null
  description = <<DESCRIPTION
The policies for a container registry.

- `azure_ad_authentication_as_arm_policy` - The policy for using Azure Resource Manager audience token for a container registry.
  - `status` - The value that indicates whether the policy is enabled or not.
- `export_policy` - The export policy for a container registry.
  - `status` - The value that indicates whether the policy is enabled or not.
- `quarantine_policy` - The quarantine policy for a container registry.
  - `status` - The value that indicates whether the policy is enabled or not.
- `retention_policy` - The retention policy for a container registry.
  - `days` - The number of days to retain an untagged manifest after which it gets purged.
  - `status` - The value that indicates whether the policy is enabled or not.
- `soft_delete_policy` - The soft delete policy for a container registry.
  - `retention_days` - The number of days after which a soft-deleted item is permanently deleted.
  - `status` - The value that indicates whether the policy is enabled or not.
- `trust_policy` - The content trust policy for a container registry.
  - `status` - The value that indicates whether the policy is enabled or not.
  - `type` - The type of trust policy.

DESCRIPTION
}

variable "public_network_access" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Whether or not public network access is allowed for the container registry.
DESCRIPTION
}

variable "regional_endpoints" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Enable per-region endpoints for accessing registry.
DESCRIPTION
}

variable "role_assignment_mode" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Determines registry role assignment mode.
DESCRIPTION
}

variable "zone_redundancy" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Whether or not zone redundancy is enabled for this container registry
DESCRIPTION
}
