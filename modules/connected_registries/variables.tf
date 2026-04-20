variable "location" {
  type        = string
  description = <<DESCRIPTION
The location of the resource.
DESCRIPTION
}

variable "mode" {
  type        = any
  description = <<DESCRIPTION
The mode of the connected registry resource that indicates the permissions of the registry.
DESCRIPTION
}

variable "name" {
  type        = string
  description = <<DESCRIPTION
The name of the resource.
DESCRIPTION
}

variable "parent" {
  type = object({
    id = optional(string)
    sync_properties = object({
      message_ttl = string
      schedule    = optional(string)
      sync_window = optional(string)
      token_id    = string
    })
  })
  description = <<DESCRIPTION
The parent of the connected registry.

- `id` - The resource ID of the parent to which the connected registry will be associated.
- `sync_properties` - The sync properties of the connected registry with its parent.
  - `message_ttl` - The period of time for which a message is available to sync before it is expired. Specify the duration using the format P[n]Y[n]M[n]DT[n]H[n]M[n]S as per ISO8601.
  - `schedule` - The cron expression indicating the schedule that the connected registry will sync with its parent.
  - `sync_window` - The time window during which sync is enabled for each schedule occurrence. Specify the duration using the format P[n]Y[n]M[n]DT[n]H[n]M[n]S as per ISO8601.
  - `token_id` - The resource ID of the ACR token used to authenticate the connected registry to its parent during sync.

DESCRIPTION
}

variable "parent_id" {
  type        = string
  description = <<DESCRIPTION
The parent resource ID for this resource.
DESCRIPTION
}

variable "client_token_ids" {
  type        = list(string)
  default     = null
  description = <<DESCRIPTION
The list of the ACR token resource IDs used to authenticate clients to the connected registry.
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

variable "garbage_collection" {
  type = object({
    enabled  = optional(bool)
    schedule = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
The garbage collection properties of the connected registry.

- `enabled` - Indicates whether garbage collection is enabled for the connected registry.
- `schedule` - The cron expression indicating the schedule that the connected registry will run garbage collection.

DESCRIPTION
}

variable "logging" {
  type = object({
    audit_log_status = optional(any)
    log_level        = optional(any)
  })
  default     = null
  description = <<DESCRIPTION
The logging properties of the connected registry.

- `audit_log_status` - Indicates whether audit logs are enabled on the connected registry.
- `log_level` - The verbosity of logs persisted on the connected registry.

DESCRIPTION
}

variable "notifications_list" {
  type        = list(string)
  default     = null
  description = <<DESCRIPTION
The list of notifications subscription information for the connected registry.
DESCRIPTION
}
