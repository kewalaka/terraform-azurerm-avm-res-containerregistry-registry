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
variable "tags" {
  description = <<DESCRIPTION
(Optional) Tags of the resource.
DESCRIPTION
  type        = map(string)
  default     = null
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

variable "admin_user_enabled" {
  description = <<DESCRIPTION
The value that indicates whether the admin user is enabled.
DESCRIPTION
  type        = bool
  default     = null
}

variable "anonymous_pull_enabled" {
  description = <<DESCRIPTION
Enables registry-wide pull from unauthenticated clients.
DESCRIPTION
  type        = bool
  default     = null
}

variable "auto_generated_domain_name_label_scope" {
  description = <<DESCRIPTION
Determines the domain name label reuse scope.
DESCRIPTION
  type        = any
  default     = null
}

variable "data_endpoint_enabled" {
  description = <<DESCRIPTION
Enable a single data endpoint per region for serving data.
DESCRIPTION
  type        = bool
  default     = null
}

variable "encryption" {
  description = <<DESCRIPTION
The encryption settings of container registry.

- `key_vault_properties` - Key vault properties.
  - `identity` - The client id of the identity which will be used to access key vault.
  - `key_identifier` - Key vault uri to access the encryption key.
- `status` - Indicates whether or not the encryption is enabled for container registry.

DESCRIPTION
  type = object({
    key_vault_properties = optional(object({
      identity       = optional(string)
      key_identifier = optional(string)
    }))
    status = optional(any)
  })
  default = null
}

variable "endpoint_protocol" {
  description = <<DESCRIPTION
The connectivity protocol for the registry, such as IPv4 or dual stack (IPv4 and IPv6).
DESCRIPTION
  type        = any
  default     = null
}

variable "metadata_search" {
  description = <<DESCRIPTION
Determines whether registry artifacts are indexed for metadata search.
DESCRIPTION
  type        = any
  default     = null
}

variable "network_rule_bypass_allowed_for_tasks" {
  description = <<DESCRIPTION
Whether or not Tasks allowed to bypass the network rules for this container registry.
DESCRIPTION
  type        = bool
  default     = null
}

variable "network_rule_bypass_options" {
  description = <<DESCRIPTION
Whether to allow trusted Azure services to access a network restricted registry.
DESCRIPTION
  type        = any
  default     = null
}

variable "network_rule_set" {
  description = <<DESCRIPTION
The network rule set for a container registry.

- `default_action` - The default action of allow or deny when no other rules match.
- `ip_rules` - The IP ACL rules.

DESCRIPTION
  type = object({
    default_action = any
    ip_rules = optional(list(object({
      action = optional(any)
      value  = string
    })))
  })
  default = null
}

variable "policies" {
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
  default = null
}

variable "public_network_access" {
  description = <<DESCRIPTION
Whether or not public network access is allowed for the container registry.
DESCRIPTION
  type        = any
  default     = null
}

variable "regional_endpoints" {
  description = <<DESCRIPTION
Enable per-region endpoints for accessing registry.
DESCRIPTION
  type        = any
  default     = null
}

variable "role_assignment_mode" {
  description = <<DESCRIPTION
Determines registry role assignment mode.
DESCRIPTION
  type        = any
  default     = null
}

variable "zone_redundancy" {
  description = <<DESCRIPTION
Whether or not zone redundancy is enabled for this container registry
DESCRIPTION
  type        = any
  default     = null
}

variable "sku" {
  description = <<DESCRIPTION
The SKU of the container registry.

- `name` - The SKU name of the container registry. Required for registry creation.

DESCRIPTION
  type = object({
    name = any
  })
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = <<DESCRIPTION
Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `"CanNotDelete"` and `"ReadOnly"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
DESCRIPTION

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly"], var.lock.kind) : true
    error_message = "Lock kind must be either `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}

variable "role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of role assignments to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - (Optional) The description of the role assignment.
- `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
- `condition` - (Optional) The condition which will be used to scope the role assignment.
- `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.
- `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
- `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
DESCRIPTION
  nullable    = false
}

variable "diagnostic_settings" {
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
  A map of diagnostic settings to create on the Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

  - `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.
  - `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.
  - `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.
  - `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.
  - `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.
  - `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.
  - `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.
  - `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.
  - `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.
  - `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.
  DESCRIPTION
  nullable    = false

  validation {
    condition     = alltrue([for _, v in var.diagnostic_settings : contains(["Dedicated", "AzureDiagnostics"], v.log_analytics_destination_type)])
    error_message = "Log analytics destination type must be one of: 'Dedicated', 'AzureDiagnostics'."
  }
  validation {
    condition = alltrue(
      [
        for _, v in var.diagnostic_settings :
        v.workspace_resource_id != null || v.storage_account_resource_id != null || v.event_hub_authorization_rule_resource_id != null || v.marketplace_partner_resource_id != null
      ]
    )
    error_message = "At least one of `workspace_resource_id`, `storage_account_resource_id`, `marketplace_partner_resource_id`, or `event_hub_authorization_rule_resource_id`, must be set."
  }
}

variable "private_endpoints" {
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default     = {}
  description = <<DESCRIPTION
A map of private endpoints to create on the Container Registry. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `name` - (Optional) The name of the private endpoint. One will be generated if not set.
- `role_assignments` - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See `var.role_assignments` for more information.
- `lock` - (Optional) The lock level to apply to the private endpoint. Default is `None`. Possible values are `None`, `CanNotDelete`, and `ReadOnly`.
- `tags` - (Optional) A mapping of tags to assign to the private endpoint.
- `subnet_resource_id` - The resource ID of the subnet to deploy the private endpoint in.
- `private_dns_zone_group_name` - (Optional) The name of the private DNS zone group. One will be generated if not set.
- `private_dns_zone_resource_ids` - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.
- `application_security_group_associations` - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
- `private_service_connection_name` - (Optional) The name of the private service connection. One will be generated if not set.
- `network_interface_name` - (Optional) The name of the network interface. One will be generated if not set.
- `location` - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.
- `resource_group_name` - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Container Registry.
- `ip_configurations` - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
  - `name` - The name of the IP configuration.
  - `private_ip_address` - The private IP address of the IP configuration.
DESCRIPTION
  nullable    = false
}

variable "private_endpoints_manage_dns_zone_group" {
  type        = bool
  default     = true
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  nullable    = false
}

