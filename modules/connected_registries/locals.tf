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
    }
  }
}
