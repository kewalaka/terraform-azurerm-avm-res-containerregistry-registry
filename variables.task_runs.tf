variable "task_runs" {
  type = map(object({
    enable_telemetry = optional(bool)
    force_update_tag = optional(string)
    location         = string
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name = string
    run_request = optional(object({
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
      source_location  = optional(string)
      target           = optional(string)
      task_file_path   = optional(string)
      task_id          = optional(string)
      timeout          = optional(number)
      type             = string
      values_file_path = optional(string)
      values = optional(list(object({
        is_secret = optional(bool)
        name      = string
        value     = string
      })))
    }))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of task run instances for the container registry with the following attributes:

**name**
The name of the task run resource.

**location**
The location of the resource.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**force_update_tag**
How the run should be forced to rerun even if the run request configuration has not changed.

**managed_identities**
Controls the Managed Identity configuration on this resource.
- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.
- `user_assigned_resource_ids` - (Optional) Specifies a set of User Assigned Managed Identity resource IDs to be assigned.

**run_request**
The request (parameters) for the run.
- `agent_configuration` - The machine configuration of the run agent.
  - `cpu` - The CPU configuration in terms of number of cores required for the run.
- `agent_pool_name` - The dedicated agent pool for the run.
- `arguments` - The collection of override arguments to be used when executing the run.
- `credentials` - The properties that describe a set of credentials that will be used when this run is invoked.
  - `custom_registries` - Describes the credential parameters for accessing other custom registries.
  - `source_registry` - Describes the credential parameters for accessing the source registry.
- `docker_file_path` - The Docker file path relative to the source location.
- `encoded_task_content` - Base64 encoded value of the template/definition file content.
- `encoded_values_content` - Base64 encoded value of the parameters/values file content.
- `image_names` - The fully qualified image names including the repository and tag.
- `is_archive_enabled` - Whether archiving is enabled for the run.
- `is_push_enabled` - Whether the image built should be pushed to the registry.
- `log_template` - The template that describes the repository and tag information for run log artifact.
- `no_cache` - Whether the image cache is enabled.
- `override_task_step_properties` - Set of overridable parameters that can be passed when running a Task.
- `platform` - The platform properties against which the run has to happen.
- `source_location` - The URL (absolute or relative) of the source context.
- `target` - The name of the target build stage for the docker build.
- `task_file_path` - The template/definition file path relative to the source.
- `task_id` - The resource ID of task against which run has to be queued.
- `timeout` - Run timeout in seconds (300-28800).
- `type` - The type of run request. One of: DockerBuildRequest, EncodedTaskRunRequest, FileTaskRunRequest, TaskRunRequest.
- `values` - The collection of overridable values that can be passed when running a task.
- `values_file_path` - The values/parameters file path relative to the source.
DESCRIPTION
}
