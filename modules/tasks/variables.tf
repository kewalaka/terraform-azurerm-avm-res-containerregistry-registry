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
The dedicated agent pool for the task.
DESCRIPTION
}

variable "credentials" {
  type = object({
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
  })
  default     = null
  description = <<DESCRIPTION
The properties that describes a set of credentials that will be used when this run is invoked.

- `custom_registries` - Describes the credential parameters for accessing other custom registries. The key for the dictionary item will be the registry login server (myregistry.azurecr.io) and the value of the item will be the registry credentials for accessing the registry.
- `source_registry` - Describes the credential parameters for accessing the source registry.
  - `identity` - The Entra identity used for source registry login. The value is `[system]` for system-assigned managed identity, `[caller]` for caller identity, and client ID for user-assigned managed identity.
  - `login_mode` - The authentication mode which determines the source registry login scope. The credentials for the source registry will be generated using the given scope. These credentials will be used to login to the source registry during the run.

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

variable "is_system_task" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
The value of this property indicates whether the task resource is system task or not.
DESCRIPTION
}

variable "log_template" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The template that describes the repository and tag information for run log artifact.
DESCRIPTION
}

# tflint-ignore: terraform_unused_declarations
variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource.
DESCRIPTION
  nullable    = false
}

variable "platform" {
  type = object({
    architecture = optional(any)
    os           = any
    variant      = optional(any)
  })
  default     = null
  description = <<DESCRIPTION
The platform properties against which the run has to happen.

- `architecture` - The OS architecture.
- `os` - The operating system type required for the run.
- `variant` - Variant of the CPU.

DESCRIPTION
}

variable "status" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The current status of task.
DESCRIPTION
}

variable "step" {
  type = object({
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
  })
  default     = null
  description = <<DESCRIPTION
The properties of a task step.

- `arguments` - The collection of override arguments to be used when executing this build step.
- `context_access_token` - The token (git PAT or SAS token of storage account blob) associated with the context for a step.
- `context_path` - The URL(absolute or relative) of the source context for the task step.
- `docker_file_path` - The Docker file path relative to the source context.
- `encoded_task_content` - Base64 encoded value of the template/definition file content.
- `encoded_values_content` - Base64 encoded value of the parameters/values file content.
- `image_names` - The fully qualified image names including the repository and tag.
- `is_push_enabled` - The value of this property indicates whether the image built should be pushed to the registry or not.
- `no_cache` - The value of this property indicates whether the image cache is enabled or not.
- `target` - The name of the target build stage for the docker build.
- `task_file_path` - The task template/definition file path relative to the source context.
- `type` - The type property.
- `values` - The collection of overridable values that can be passed when running a task.
- `values_file_path` - The task values/parameters file path relative to the source context.

DESCRIPTION

  validation {
    condition     = var.step == null || contains(["Docker", "EncodedTask", "FileTask"], var.step.type)
    error_message = "step.type must be one of: [\"Docker\", \"EncodedTask\", \"FileTask\"]."
  }
}

# tflint-ignore: terraform_unused_declarations
variable "tags" {
  type        = map(string)
  default     = null
  description = <<DESCRIPTION
(Optional) Tags of the resource.
DESCRIPTION
}

variable "timeout" {
  type        = number
  default     = null
  description = <<DESCRIPTION
Run timeout in seconds.
DESCRIPTION

  validation {
    condition     = var.timeout == null || var.timeout >= 300
    error_message = "timeout must be greater than or equal to 300."
  }
  validation {
    condition     = var.timeout == null || var.timeout <= 28800
    error_message = "timeout must be less than or equal to 28800."
  }
}

variable "trigger" {
  type = object({
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
  })
  default     = null
  description = <<DESCRIPTION
The properties that describe all triggers for the task.

- `base_image_trigger` - The trigger based on base image dependencies.
  - `base_image_trigger_type` - The type of the auto trigger for base image dependency updates.
  - `name` - The name of the trigger.
  - `status` - The current status of trigger.
  - `update_trigger_endpoint` - The endpoint URL for receiving update triggers.
  - `update_trigger_payload_type` - Type of Payload body for Base image update triggers.
- `source_triggers` - The collection of triggers based on source code repository.
- `timer_triggers` - The collection of timer triggers.

DESCRIPTION
}
