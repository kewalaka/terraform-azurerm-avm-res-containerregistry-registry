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
      agentConfiguration = var.agent_configuration == null ? null : {
        cpu = var.agent_configuration.cpu
      }
      agentPoolName = var.agent_pool_name
      credentials = var.credentials == null ? null : {
        customRegistries = var.credentials.custom_registries == null ? null : { for k, value in var.credentials.custom_registries : k => value == null ? null : {
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
        sourceRegistry = var.credentials.source_registry == null ? null : {
          identity  = var.credentials.source_registry.identity
          loginMode = var.credentials.source_registry.login_mode
        }
      }
      isSystemTask = var.is_system_task
      logTemplate  = var.log_template
      platform = var.platform == null ? null : {
        architecture = var.platform.architecture
        os           = var.platform.os
        variant      = var.platform.variant
      }
      status = var.status
      step = var.step == null ? null : {
        arguments = var.step.arguments == null ? null : [for item in var.step.arguments : item == null ? null : {
          isSecret = item.is_secret
          name     = item.name
          value    = item.value
        }]
        contextAccessToken   = var.step.context_access_token
        contextPath          = var.step.context_path
        dockerFilePath       = var.step.docker_file_path
        encodedTaskContent   = var.step.encoded_task_content
        encodedValuesContent = var.step.encoded_values_content
        imageNames           = var.step.image_names == null ? null : [for item in var.step.image_names : item]
        isPushEnabled        = var.step.is_push_enabled
        noCache              = var.step.no_cache
        target               = var.step.target
        taskFilePath         = var.step.task_file_path
        type                 = var.step.type
        values = var.step.values == null ? null : [for item in var.step.values : item == null ? null : {
          isSecret = item.is_secret
          name     = item.name
          value    = item.value
        }]
        valuesFilePath = var.step.values_file_path
      }
      timeout = var.timeout
      trigger = var.trigger == null ? null : {
        baseImageTrigger = var.trigger.base_image_trigger == null ? null : {
          baseImageTriggerType     = var.trigger.base_image_trigger.base_image_trigger_type
          name                     = var.trigger.base_image_trigger.name
          status                   = var.trigger.base_image_trigger.status
          updateTriggerEndpoint    = var.trigger.base_image_trigger.update_trigger_endpoint
          updateTriggerPayloadType = var.trigger.base_image_trigger.update_trigger_payload_type
        }
        sourceTriggers = var.trigger.source_triggers == null ? null : [for item in var.trigger.source_triggers : item == null ? null : {
          name = item.name
          sourceRepository = item.source_repository == null ? null : {
            branch        = item.source_repository.branch
            repositoryUrl = item.source_repository.repository_url
            sourceControlAuthProperties = item.source_repository.source_control_auth_properties == null ? null : {
              expiresIn    = item.source_repository.source_control_auth_properties.expires_in
              refreshToken = item.source_repository.source_control_auth_properties.refresh_token
              scope        = item.source_repository.source_control_auth_properties.scope
              token        = item.source_repository.source_control_auth_properties.token
              tokenType    = item.source_repository.source_control_auth_properties.token_type
            }
            sourceControlType = item.source_repository.source_control_type
          }
          sourceTriggerEvents = item.source_trigger_events == null ? null : [for item in item.source_trigger_events : item]
          status              = item.status
        }]
        timerTriggers = var.trigger.timer_triggers == null ? null : [for item in var.trigger.timer_triggers : item == null ? null : {
          name     = item.name
          schedule = item.schedule
          status   = item.status
        }]
      }
    }
  }
}
