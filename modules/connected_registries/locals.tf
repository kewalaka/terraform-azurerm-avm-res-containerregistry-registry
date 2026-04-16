locals {
  resource_body = {
    properties = {
      clientTokenIds = var.client_token_ids == null ? null : [for item in var.client_token_ids : item]
      garbageCollection = var.garbage_collection == null ? null : {
        enabled  = var.garbage_collection.enabled
        schedule = var.garbage_collection.schedule
      }
      logging = var.logging == null ? null : {
        auditLogStatus = var.logging.audit_log_status
        logLevel       = var.logging.log_level
      }
      loginServer       = var.login_server == null ? null : {}
      mode              = var.mode
      notificationsList = var.notifications_list == null ? null : [for item in var.notifications_list : item]
      parent = var.parent == null ? null : {
        id = var.parent.id
        syncProperties = var.parent.sync_properties == null ? null : {
          messageTtl = var.parent.sync_properties.message_ttl
          schedule   = var.parent.sync_properties.schedule
          syncWindow = var.parent.sync_properties.sync_window
          tokenId    = var.parent.sync_properties.token_id
        }
      }
      registrySyncResult = var.registry_sync_result == null ? null : {
        lastSuccessfulSyncEndTime = var.registry_sync_result.last_successful_sync_end_time
        lastSyncEndTime           = var.registry_sync_result.last_sync_end_time
        lastSyncStartTime         = var.registry_sync_result.last_sync_start_time
      }
    }
  }
}
