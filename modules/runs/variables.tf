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

variable "agent_configuration" {
  description = <<DESCRIPTION
The machine configuration of the run agent.

- `cpu` - The CPU configuration in terms of number of cores required for the run.

DESCRIPTION
  type = object({
    cpu = optional(number)
  })
  default = null
}

variable "agent_pool_name" {
  description = <<DESCRIPTION
The dedicated agent pool for the run.
DESCRIPTION
  type        = string
  default     = null
}

variable "create_time" {
  description = <<DESCRIPTION
The time the run was scheduled.
DESCRIPTION
  type        = string
  default     = null
}

variable "custom_registries" {
  description = <<DESCRIPTION
The list of custom registries that were logged in during this run.
DESCRIPTION
  type        = list(string)
  default     = null
}

variable "finish_time" {
  description = <<DESCRIPTION
The time the run finished.
DESCRIPTION
  type        = string
  default     = null
}

variable "image_update_trigger" {
  description = <<DESCRIPTION
The image update trigger that caused the run. This is applicable if the task has base image trigger configured.

- `id` - The unique ID of the trigger.
- `images` - The list of image updates that caused the build.
- `timestamp` - The timestamp when the image update happened.

DESCRIPTION
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
  default = null
}

variable "is_archive_enabled" {
  description = <<DESCRIPTION
The value that indicates whether archiving is enabled or not.
DESCRIPTION
  type        = bool
  default     = null
}

variable "last_updated_time" {
  description = <<DESCRIPTION
The last updated time for the run.
DESCRIPTION
  type        = string
  default     = null
}

variable "output_images" {
  description = <<DESCRIPTION
The list of all images that were generated from the run. This is applicable if the run generates base image dependencies.
DESCRIPTION
  type = list(object({
    digest     = optional(string)
    registry   = optional(string)
    repository = optional(string)
    tag        = optional(string)
  }))
  default = null
}

variable "platform" {
  description = <<DESCRIPTION
The platform properties against which the run will happen.

- `architecture` - The OS architecture.
- `os` - The operating system type required for the run.
- `variant` - Variant of the CPU.

DESCRIPTION
  type = object({
    architecture = optional(any)
    os           = any
    variant      = optional(any)
  })
  default = null
}

variable "provisioning_state" {
  description = <<DESCRIPTION
The provisioning state of a run.
DESCRIPTION
  type        = any
  default     = null
}

variable "run_id" {
  description = <<DESCRIPTION
The unique identifier for the run.
DESCRIPTION
  type        = string
  default     = null
}

variable "run_type" {
  description = <<DESCRIPTION
The type of run.
DESCRIPTION
  type        = any
  default     = null
}

variable "source_registry_auth" {
  description = <<DESCRIPTION
The scope of the credentials that were used to login to the source registry during this run.
DESCRIPTION
  type        = string
  default     = null
}

variable "source_trigger" {
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
  type = object({
    branch_name     = optional(string)
    commit_id       = optional(string)
    event_type      = optional(string)
    id              = optional(string)
    provider_type   = optional(string)
    pull_request_id = optional(string)
    repository_url  = optional(string)
  })
  default = null
}

variable "start_time" {
  description = <<DESCRIPTION
The time the run started.
DESCRIPTION
  type        = string
  default     = null
}

variable "status" {
  description = <<DESCRIPTION
The current status of the run.
DESCRIPTION
  type        = any
  default     = null
}

variable "task" {
  description = <<DESCRIPTION
The task against which run was scheduled.
DESCRIPTION
  type        = string
  default     = null
}

variable "timer_trigger" {
  description = <<DESCRIPTION
The timer trigger that caused the run.

- `schedule_occurrence` - The occurrence that triggered the run.
- `timer_trigger_name` - The timer trigger name that caused the run.

DESCRIPTION
  type = object({
    schedule_occurrence = optional(string)
    timer_trigger_name  = optional(string)
  })
  default = null
}

variable "update_trigger_token" {
  description = <<DESCRIPTION
The update trigger token passed for the Run.
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

