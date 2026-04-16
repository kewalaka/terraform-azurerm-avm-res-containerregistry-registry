variable "admin_user_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
Specifies whether the admin user is enabled. Defaults to `false`. The admin account is a single user account with admin access to the registry, avoid using this for production workloads.
DESCRIPTION
}

variable "anonymous_pull_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
Specifies whether anonymous (unauthenticated) pull access to this Container Registry is allowed. Requires Standard or Premium SKU. Defaults to `false`.
DESCRIPTION
}

variable "auto_generated_domain_name_label_scope" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Determines the domain name label reuse scope. Possible values include `TenantReuse`, `SubscriptionReuse`, `ResourceGroupReuse`, `NoReuse`, and `Unsecure`.
DESCRIPTION
}

variable "data_endpoint_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
Specifies whether to enable dedicated data endpoints for this Container Registry. Requires Premium SKU. Defaults to `false`.
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
The encryption settings for the Container Registry using a customer-managed key. Requires Premium SKU.

- `key_vault_properties` - (Optional) Key vault properties for the encryption key.
  - `identity` - (Optional) The client ID of the managed identity used to access the key vault.
  - `key_identifier` - (Optional) The full URI of the encryption key in the key vault, e.g. `https://myvault.vault.azure.net/keys/mykey/myversion`.
- `status` - (Optional) Indicates whether encryption is enabled. Possible values are `enabled` and `disabled`.
DESCRIPTION
}

variable "endpoint_protocol" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Specifies the connectivity protocol for the registry. Possible values are `IPv4` and `IPv4IPv6` (dual stack). Defaults to `null`.
DESCRIPTION
}

variable "metadata_search" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Specifies whether registry artifacts are indexed for metadata search. Possible values are `Enabled` and `Disabled`. Requires Premium SKU.
DESCRIPTION
}

variable "network_rule_bypass_allowed_for_tasks" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
Specifies whether to allow trusted Azure Services to access a network restricted Container Registry for tasks such as image build. Defaults to `null`.
DESCRIPTION
}

variable "network_rule_bypass_options" {
  type        = any
  default     = "None"
  description = <<DESCRIPTION
Specifies whether to allow trusted Azure services access to a network restricted Container Registry. Possible values are `None` and `AzureServices`. Defaults to `None`.
DESCRIPTION

  validation {
    condition     = var.network_rule_bypass_options == null ? true : contains(["AzureServices", "None"], var.network_rule_bypass_options)
    error_message = "The network_rule_bypass_options variable must be either `AzureServices` or `None`."
  }
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
The network rule set configuration for the Container Registry. Requires Premium SKU.

- `default_action` - (Required) The default action when no other rules match. Possible values are `Allow` and `Deny`.
- `ip_rules` - (Optional) A list of IP ACL rules.
  - `action` - (Optional) The action of the IP rule. Only `Allow` is permitted.
  - `value` - (Required) The CIDR block from which requests will match the rule.
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
The policies for the Container Registry. All sub-policies require Premium SKU.

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
Specifies whether public network access is permitted for the Container Registry. Possible values are `Enabled` and `Disabled`.
DESCRIPTION

  validation {
    condition     = var.public_network_access == null ? true : contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "The public_network_access value must be either `Enabled` or `Disabled`."
  }
}

variable "regional_endpoints" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Specifies whether per-region endpoints are enabled for accessing the registry. Possible values are `Enabled` and `Disabled`.
DESCRIPTION
}

variable "role_assignment_mode" {
  type        = any
  default     = null
  description = <<DESCRIPTION
Determines the registry role assignment mode. Possible values are `RBAC` and `Legacy`.
DESCRIPTION
}

variable "sku" {
  type = object({
    name = string
  })
  default = {
    name = "Premium"
  }
  description = <<DESCRIPTION
The SKU of the Container Registry. Default is `Premium`.

- `name` - (Required) The SKU name of the Container Registry. Possible values are `Basic`, `Standard` and `Premium`.
DESCRIPTION

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku.name)
    error_message = "The SKU name must be either `Basic`, `Standard` or `Premium`."
  }
}

variable "zone_redundancy" {
  type        = any
  default     = "Enabled"
  description = <<DESCRIPTION
Specifies whether zone redundancy is enabled for this Container Registry. Possible values are `Enabled` and `Disabled`. Defaults to `Enabled`. Modifying this forces a new resource to be created. Requires Premium SKU.
DESCRIPTION

  validation {
    condition     = var.zone_redundancy == null ? true : contains(["Enabled", "Disabled"], var.zone_redundancy)
    error_message = "The zone_redundancy value must be either `Enabled` or `Disabled`."
  }
}
