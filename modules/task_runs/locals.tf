locals {
  managed_identities = {
    system_assigned_user_assigned = var.managed_identities.system_assigned || length(var.managed_identities.user_assigned_resource_ids) > 0 ? {
      this = {
        type                       = var.managed_identities.system_assigned && length(var.managed_identities.user_assigned_resource_ids) > 0 ? "SystemAssigned, UserAssigned" : length(var.managed_identities.user_assigned_resource_ids) > 0 ? "UserAssigned" : "SystemAssigned"
        user_assigned_resource_ids = var.managed_identities.user_assigned_resource_ids
      }
    } : {}
    system_assigned = var.managed_identities.system_assigned ? {
      this = {
        type = "SystemAssigned"
      }
    } : {}
    user_assigned = length(var.managed_identities.user_assigned_resource_ids) > 0 ? {
      this = {
        type                       = "UserAssigned"
        user_assigned_resource_ids = var.managed_identities.user_assigned_resource_ids
      }
    } : {}
  }
  resource_body = {
    properties = {
      forceUpdateTag = var.force_update_tag
      runRequest = var.run_request == null ? null : {
        agentConfiguration = var.run_request.agent_configuration == null ? null : {
          cpu = var.run_request.agent_configuration.cpu
        }
        agentPoolName = var.run_request.agent_pool_name
        arguments = var.run_request.arguments == null ? null : [for item in var.run_request.arguments : item == null ? null : {
          isSecret = item.is_secret
          name     = item.name
          value    = item.value
        }]
        credentials = var.run_request.credentials == null ? null : {
          customRegistries = var.run_request.credentials.custom_registries == null ? null : { for k, value in var.run_request.credentials.custom_registries : k => value == null ? null : {
            identity = value.identity
            password = value.password == null ? null : {
              type  = value.password.type
              value = value.password.value
            }
            userName = value.user_name == null ? null : {
              type  = value.user_name.type
              value = value.user_name.value
            }
          } }
          sourceRegistry = var.run_request.credentials.source_registry == null ? null : {
            identity  = var.run_request.credentials.source_registry.identity
            loginMode = var.run_request.credentials.source_registry.login_mode
          }
        }
        dockerFilePath       = var.run_request.docker_file_path
        encodedTaskContent   = var.run_request.encoded_task_content
        encodedValuesContent = var.run_request.encoded_values_content
        imageNames           = var.run_request.image_names == null ? null : [for item in var.run_request.image_names : item]
        isArchiveEnabled     = var.run_request.is_archive_enabled
        isPushEnabled        = var.run_request.is_push_enabled
        logTemplate          = var.run_request.log_template
        noCache              = var.run_request.no_cache
        overrideTaskStepProperties = var.run_request.override_task_step_properties == null ? null : {
          arguments = var.run_request.override_task_step_properties.arguments == null ? null : [for item in var.run_request.override_task_step_properties.arguments : item == null ? null : {
            isSecret = item.is_secret
            name     = item.name
            value    = item.value
          }]
          contextPath        = var.run_request.override_task_step_properties.context_path
          file               = var.run_request.override_task_step_properties.file
          target             = var.run_request.override_task_step_properties.target
          updateTriggerToken = var.run_request.override_task_step_properties.update_trigger_token
          values = var.run_request.override_task_step_properties.values == null ? null : [for item in var.run_request.override_task_step_properties.values : item == null ? null : {
            isSecret = item.is_secret
            name     = item.name
            value    = item.value
          }]
        }
        platform = var.run_request.platform == null ? null : {
          architecture = var.run_request.platform.architecture
          os           = var.run_request.platform.os
          variant      = var.run_request.platform.variant
        }
        sourceLocation = var.run_request.source_location
        target         = var.run_request.target
        taskFilePath   = var.run_request.task_file_path
        taskId         = var.run_request.task_id
        timeout        = var.run_request.timeout
        type           = var.run_request.type
        values = var.run_request.values == null ? null : [for item in var.run_request.values : item == null ? null : {
          isSecret = item.is_secret
          name     = item.name
          value    = item.value
        }]
        valuesFilePath = var.run_request.values_file_path
      }
    }
  }
}
