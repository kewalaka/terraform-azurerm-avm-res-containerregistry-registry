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

variable "agent_configuration" {
  type = object({
    cpu = optional(number)
  })
  default     = null
  description = <<DESCRIPTION
The machine configuration of the run agent.

- `cpu` - The CPU configuration in terms of number of cores required for the run.

DESCRIPTION
}

variable "agent_pool_name" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The dedicated agent pool for the run.
DESCRIPTION
}

variable "create_time" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The time the run was scheduled.
DESCRIPTION
}

variable "custom_registries" {
  type        = list(string)
  default     = null
  description = <<DESCRIPTION
The list of custom registries that were logged in during this run.
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

variable "finish_time" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The time the run finished.
DESCRIPTION
}

variable "image_update_trigger" {
  type = object({
    id = optional(string)
    images = optional(list(object({
      digest     = optional(string)
      registry   = optional(string)
      repository = optional(string)
      tag        = optional(string)
    })))
    timestamp = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
The image update trigger that caused the run. This is applicable if the task has base image trigger configured.

- `id` - The unique ID of the trigger.
- `images` - The list of image updates that caused the build.
- `timestamp` - The timestamp when the image update happened.

DESCRIPTION
}

variable "is_archive_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
The value that indicates whether archiving is enabled or not.
DESCRIPTION
}

variable "last_updated_time" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The last updated time for the run.
DESCRIPTION
}

variable "output_images" {
  type = list(object({
    digest     = optional(string)
    registry   = optional(string)
    repository = optional(string)
    tag        = optional(string)
  }))
  default     = null
  description = <<DESCRIPTION
The list of all images that were generated from the run. This is applicable if the run generates base image dependencies.
DESCRIPTION
}

variable "platform" {
  type = object({
    architecture = optional(any)
    os           = any
    variant      = optional(any)
  })
  default     = null
  description = <<DESCRIPTION
The platform properties against which the run will happen.

- `architecture` - The OS architecture.
- `os` - The operating system type required for the run.
- `variant` - Variant of the CPU.

DESCRIPTION
}

variable "provisioning_state" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The provisioning state of a run.
DESCRIPTION
}

variable "run_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The unique identifier for the run.
DESCRIPTION
}

variable "run_type" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The type of run.
DESCRIPTION
}

variable "source_registry_auth" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The scope of the credentials that were used to login to the source registry during this run.
DESCRIPTION
}

variable "source_trigger" {
  type = object({
    branch_name     = optional(string)
    commit_id       = optional(string)
    event_type      = optional(string)
    id              = optional(string)
    provider_type   = optional(string)
    pull_request_id = optional(string)
    repository_url  = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
The source trigger that caused the run.

- `branch_name` - The branch name in the repository.
- `commit_id` - The unique ID that identifies a commit.
- `event_type` - The event type of the trigger.
- `id` - The unique ID of the trigger.
- `provider_type` - The source control provider type.
- `pull_request_id` - The unique ID that identifies pull request.
- `repository_url` - The repository URL.

DESCRIPTION
}

variable "start_time" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The time the run started.
DESCRIPTION
}

variable "status" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The current status of the run.
DESCRIPTION
}

variable "task" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The task against which run was scheduled.
DESCRIPTION
}

variable "timer_trigger" {
  type = object({
    schedule_occurrence = optional(string)
    timer_trigger_name  = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
The timer trigger that caused the run.

- `schedule_occurrence` - The occurrence that triggered the run.
- `timer_trigger_name` - The timer trigger name that caused the run.

DESCRIPTION
}

variable "update_trigger_token" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The update trigger token passed for the Run.
DESCRIPTION
}
