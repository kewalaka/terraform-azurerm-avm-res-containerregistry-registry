variable "tasks" {
  type = map(object({
    agent_configuration = optional(object({
      cpu = optional(number)
    }))
    agent_pool_name = optional(string)
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
    enable_telemetry = optional(bool)
    is_system_task   = optional(bool)
    location         = string
    log_template     = optional(string)
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name = string
    platform = optional(object({
      architecture = optional(any)
      os           = any
      variant      = optional(any)
    }))
    status = optional(any)
    step = optional(object({
      arguments = optional(list(object({
        is_secret = optional(bool)
        name      = string
        value     = string
      })))
      context_access_token   = optional(string)
      context_path           = optional(string)
      docker_file_path       = optional(string)
      encoded_task_content   = optional(string)
      encoded_values_content = optional(string)
      image_names            = optional(list(string))
      is_push_enabled        = optional(bool)
      no_cache               = optional(bool)
      target                 = optional(string)
      task_file_path         = optional(string)
      type                   = string
      values = optional(list(object({
        is_secret = optional(bool)
        name      = string
        value     = string
      })))
      values_file_path = optional(string)
    }))
    tags    = optional(map(string))
    timeout = optional(number)
    trigger = optional(object({
      base_image_trigger = optional(object({
        base_image_trigger_type     = any
        name                        = string
        status                      = optional(any)
        update_trigger_endpoint     = optional(string)
        update_trigger_payload_type = optional(any)
      }))
      source_triggers = optional(list(object({
        name = string
        source_repository = object({
          branch         = optional(string)
          repository_url = string
          source_control_auth_properties = optional(object({
            expires_in    = optional(number)
            refresh_token = optional(string)
            scope         = optional(string)
            token         = string
            token_type    = any
          }))
          source_control_type = any
        })
        source_trigger_events = list(any)
        status                = optional(any)
      })))
      timer_triggers = optional(list(object({
        name     = string
        schedule = string
        status   = optional(any)
      })))
    }))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**agent_configuration**
The machine configuration of the run agent. Includes `cpu` for the number of cores required.

**agent_pool_name**
The dedicated agent pool for the task.

**credentials**
The properties that describes a set of credentials that will be used when this run is invoked.

**is_system_task**
The value of this property indicates whether the task resource is system task or not.

**log_template**
The template that describes the repository and tag information for run log artifact.

**managed_identities**
Controls the Managed Identity configuration on this resource.

**platform**
The platform properties against which the run has to happen. Includes `architecture`, `os`, and `variant`.

**status**
The current status of task.

**step**
The properties of a task step. Includes type (Docker, EncodedTask, FileTask) and related configuration.

**tags**
(Optional) Tags of the resource.

**timeout**
Run timeout in seconds (300-28800).

**trigger**
The properties that describe all triggers for the task, including base image, source, and timer triggers.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
}
