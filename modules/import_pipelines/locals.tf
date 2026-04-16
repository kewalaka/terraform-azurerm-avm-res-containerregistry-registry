locals {
  resource_body = {
    properties = {
      options = var.options == null ? null : [for item in var.options : item]
      source = var.pipeline_source == null ? null : {
        keyVaultUri       = var.pipeline_source.key_vault_uri
        storageAccessMode = var.pipeline_source.storage_access_mode
        type              = var.pipeline_source.type
        uri               = var.pipeline_source.uri
      }
      trigger = var.trigger == null ? null : {
        sourceTrigger = var.trigger.source_trigger == null ? null : {
          status = var.trigger.source_trigger.status
        }
      }
    }
  }
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
}
