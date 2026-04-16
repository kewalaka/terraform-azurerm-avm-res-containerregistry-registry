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

variable "client_token_ids" {
  description = <<DESCRIPTION
The list of the ACR token resource IDs used to authenticate clients to the connected registry.
DESCRIPTION
  type        = list(string)
  default     = null
}

variable "garbage_collection" {
  description = <<DESCRIPTION
The garbage collection properties of the connected registry.

- `enabled` - Indicates whether garbage collection is enabled for the connected registry.
- `schedule` - The cron expression indicating the schedule that the connected registry will run garbage collection.

DESCRIPTION
  type = object({
    enabled  = optional(bool)
    schedule = optional(string)
  })
  default = null
}

variable "logging" {
  description = <<DESCRIPTION
The logging properties of the connected registry.

- `audit_log_status` - Indicates whether audit logs are enabled on the connected registry.
- `log_level` - The verbosity of logs persisted on the connected registry.

DESCRIPTION
  type = object({
    audit_log_status = optional(any)
    log_level        = optional(any)
  })
  default = null
}

variable "login_server" {
  description = <<DESCRIPTION
The login server properties of the connected registry.


DESCRIPTION
  type        = object({})
  default     = null
}

variable "mode" {
  description = <<DESCRIPTION
The mode of the connected registry resource that indicates the permissions of the registry.
DESCRIPTION
  type        = any
}

variable "notifications_list" {
  description = <<DESCRIPTION
The list of notifications subscription information for the connected registry.
DESCRIPTION
  type        = list(string)
  default     = null
}

variable "parent" {
  description = <<DESCRIPTION
The parent of the connected registry.

- `id` - The resource ID of the parent to which the connected registry will be associated.
- `sync_properties` - The sync properties of the connected registry with its parent.
  - `message_ttl` - The period of time for which a message is available to sync before it is expired. Specify the duration using the format P[n]Y[n]M[n]DT[n]H[n]M[n]S as per ISO8601.
  - `schedule` - The cron expression indicating the schedule that the connected registry will sync with its parent.
  - `sync_window` - The time window during which sync is enabled for each schedule occurrence. Specify the duration using the format P[n]Y[n]M[n]DT[n]H[n]M[n]S as per ISO8601.
  - `token_id` - The resource ID of the ACR token used to authenticate the connected registry to its parent during sync.

DESCRIPTION
  type = object({
    id = optional(string)
    sync_properties = object({
      message_ttl = string
      schedule    = optional(string)
      sync_window = optional(string)
      token_id    = string
    })
  })
}

variable "registry_sync_result" {
  description = <<DESCRIPTION
The result of the connected registry's most recent sync with its parent.

- `last_successful_sync_end_time` - The time that the connected registry's most recent successful sync ended.
- `last_sync_end_time` - The time that the connected registry's most recent sync ended.
- `last_sync_start_time` - The time that the connected registry's most recent sync started.

DESCRIPTION
  type = object({
    last_successful_sync_end_time = optional(string)
    last_sync_end_time            = optional(string)
    last_sync_start_time          = optional(string)
  })
  default = null
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

