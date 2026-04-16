variable "runs" {
  type = map(object({
    agent_configuration = optional(object({
      cpu = optional(number)
    }))
    agent_pool_name   = optional(string)
    create_time       = optional(string)
    custom_registries = optional(list(string))
    enable_telemetry  = optional(bool)
    finish_time       = optional(string)
    image_update_trigger = optional(object({
      id = optional(string)
      images = optional(list(object({
        digest     = optional(string)
        registry   = optional(string)
        repository = optional(string)
        tag        = optional(string)
      })))
      timestamp = optional(string)
    }))
    is_archive_enabled = optional(bool)
    last_updated_time  = optional(string)
    location           = string
    name               = string
    output_images = optional(list(object({
      digest     = optional(string)
      registry   = optional(string)
      repository = optional(string)
      tag        = optional(string)
    })))
    platform = optional(object({
      architecture = optional(any)
      os           = any
      variant      = optional(any)
    }))
    provisioning_state   = optional(any)
    run_id               = optional(string)
    run_type             = optional(any)
    source_registry_auth = optional(string)
    source_trigger = optional(object({
      branch_name     = optional(string)
      commit_id       = optional(string)
      event_type      = optional(string)
      id              = optional(string)
      provider_type   = optional(string)
      pull_request_id = optional(string)
      repository_url  = optional(string)
    }))
    start_time = optional(string)
    status     = optional(any)
    task       = optional(string)
    timer_trigger = optional(object({
      schedule_occurrence = optional(string)
      timer_trigger_name  = optional(string)
    }))
    update_trigger_token = optional(string)
  }))
  default     = {}
  description = <<DESCRIPTION
Map of run instances for the container registry with the following attributes:

**name**
The name of the run resource.

**location**
The location of the resource.

**agent_configuration**
The machine configuration of the run agent.
- `cpu` - The CPU configuration in terms of number of cores required for the run.

**agent_pool_name**
The dedicated agent pool for the run.

**create_time**
The time the run was scheduled.

**custom_registries**
The list of custom registries that were logged in during this run.

**finish_time**
The time the run finished.

**image_update_trigger**
The image update trigger that caused the run.
- `id` - The unique ID of the trigger.
- `images` - The list of image updates that caused the build.
  - `digest` - The image digest.
  - `registry` - The registry of the image.
  - `repository` - The repository of the image.
  - `tag` - The tag of the image.
- `timestamp` - The timestamp when the image update happened.

**is_archive_enabled**
The value that indicates whether archiving is enabled or not.

**last_updated_time**
The last updated time for the run.

**output_images**
The list of all images that were generated from the run.
- `digest` - The image digest.
- `registry` - The registry of the image.
- `repository` - The repository of the image.
- `tag` - The tag of the image.

**platform**
The platform properties against which the run will happen.
- `architecture` - The OS architecture.
- `os` - The operating system type required for the run.
- `variant` - Variant of the CPU.

**provisioning_state**
The provisioning state of a run.

**run_id**
The unique identifier for the run.

**run_type**
The type of run.

**source_registry_auth**
The scope of the credentials that were used to login to the source registry during this run.

**source_trigger**
The source trigger that caused the run.
- `branch_name` - The branch name in the repository.
- `commit_id` - The unique ID that identifies a commit.
- `event_type` - The event type of the trigger.
- `id` - The unique ID of the trigger.
- `provider_type` - The source control provider type.
- `pull_request_id` - The unique ID that identifies pull request.
- `repository_url` - The repository URL.

**start_time**
The time the run started.

**status**
The current status of the run.

**task**
The task against which run was scheduled.

**timer_trigger**
The timer trigger that caused the run.
- `schedule_occurrence` - The occurrence that triggered the run.
- `timer_trigger_name` - The timer trigger name that caused the run.

**update_trigger_token**
The update trigger token passed for the Run.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
}
