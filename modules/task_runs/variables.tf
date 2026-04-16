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

variable "force_update_tag" {
  description = <<DESCRIPTION
How the run should be forced to rerun even if the run request configuration has not changed
DESCRIPTION
  type        = string
  default     = null
}

variable "run_request" {
  description = <<DESCRIPTION
The request (parameters) for the run

- `agent_configuration` - The machine configuration of the run agent.
  - `cpu` - The CPU configuration in terms of number of cores required for the run.
- `agent_pool_name` - The dedicated agent pool for the run.
- `arguments` - The collection of override arguments to be used when executing the run.
- `credentials` - The properties that describes a set of credentials that will be used when this run is invoked.
  - `custom_registries` - Describes the credential parameters for accessing other custom registries. The key for the dictionary item will be the registry login server (myregistry.azurecr.io) and the value of the item will be the registry credentials for accessing the registry.
  - `source_registry` - Describes the credential parameters for accessing the source registry.
    - `identity` - The Entra identity used for source registry login. The value is `[system]` for system-assigned managed identity, `[caller]` for caller identity, and client ID for user-assigned managed identity.
    - `login_mode` - The authentication mode which determines the source registry login scope. The credentials for the source registry will be generated using the given scope. These credentials will be used to login to the source registry during the run.
- `docker_file_path` - The Docker file path relative to the source location.
- `encoded_task_content` - Base64 encoded value of the template/definition file content.
- `encoded_values_content` - Base64 encoded value of the parameters/values file content.
- `image_names` - The fully qualified image names including the repository and tag.
- `is_archive_enabled` - The value that indicates whether archiving is enabled for the run or not.
- `is_push_enabled` - The value of this property indicates whether the image built should be pushed to the registry or not.
- `log_template` - The template that describes the repository and tag information for run log artifact.
- `no_cache` - The value of this property indicates whether the image cache is enabled or not.
- `override_task_step_properties` - Set of overridable parameters that can be passed when running a Task.
  - `arguments` - Gets or sets the collection of override arguments to be used when executing a build step.
  - `context_path` - The source context against which run has to be queued.
  - `file` - The file against which run has to be queued.
  - `target` - The name of the target build stage for the docker build.
  - `update_trigger_token` - Base64 encoded update trigger token that will be attached with the base image trigger webhook.
  - `values` - The collection of overridable values that can be passed when running a Task.
- `platform` - The platform properties against which the run has to happen.
  - `architecture` - The OS architecture.
  - `os` - The operating system type required for the run.
  - `variant` - Variant of the CPU.
- `source_location` - The URL(absolute or relative) of the source context. It can be an URL to a tar or git repository. If it is relative URL, the relative path should be obtained from calling listBuildSourceUploadUrl API.
- `target` - The name of the target build stage for the docker build.
- `task_file_path` - The template/definition file path relative to the source.
- `task_id` - The resource ID of task against which run has to be queued.
- `timeout` - Run timeout in seconds.
- `type` - The type property.
- `values` - The collection of overridable values that can be passed when running a task.
- `values_file_path` - The values/parameters file path relative to the source.

DESCRIPTION
  type = object({
    agent_configuration = optional(object({
      cpu = optional(number)
    }))
    agent_pool_name = optional(string)
    arguments = optional(list(object({
      is_secret = optional(bool)
      name      = string
      value     = string
    })))
    credentials = optional(object({
      custom_registries = optional(map(object({
        identity = optional(string)
        password = optional(object({
          type  = optional(any)
          value = optional(string)
        }))
        user_name = optional(object({
          type  = optional(any)
          value = optional(string)
        }))
      })))
      source_registry = optional(object({
        identity   = optional(string)
        login_mode = optional(any)
      }))
    }))
    docker_file_path       = optional(string)
    encoded_task_content   = optional(string)
    encoded_values_content = optional(string)
    image_names            = optional(list(string))
    is_archive_enabled     = optional(bool)
    is_push_enabled        = optional(bool)
    log_template           = optional(string)
    no_cache               = optional(bool)
    override_task_step_properties = optional(object({
      arguments = optional(list(object({
        is_secret = optional(bool)
        name      = string
        value     = string
      })))
      context_path         = optional(string)
      file                 = optional(string)
      target               = optional(string)
      update_trigger_token = optional(string)
      values = optional(list(object({
        is_secret = optional(bool)
        name      = string
        value     = string
      })))
    }))
    platform = optional(object({
      architecture = optional(any)
      os           = any
      variant      = optional(any)
    }))
    source_location = optional(string)
    target          = optional(string)
    task_file_path  = optional(string)
    task_id         = optional(string)
    timeout         = optional(number)
    type            = string
    values = optional(list(object({
      is_secret = optional(bool)
      name      = string
      value     = string
    })))
    values_file_path = optional(string)
  })
  default = null
  validation {
    condition     = var.run_request == null || var.run_request.timeout == null || var.run_request.timeout >= 300
    error_message = "run_request.timeout must be greater than or equal to 300."
  }
  validation {
    condition     = var.run_request == null || var.run_request.timeout == null || var.run_request.timeout <= 28800
    error_message = "run_request.timeout must be less than or equal to 28800."
  }
  validation {
    condition     = var.run_request == null || contains(["DockerBuildRequest", "EncodedTaskRunRequest", "FileTaskRunRequest", "TaskRunRequest"], var.run_request.type)
    error_message = "run_request.type must be one of: [\"DockerBuildRequest\", \"EncodedTaskRunRequest\", \"FileTaskRunRequest\", \"TaskRunRequest\"]."
  }
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

