locals {
  resource_body = {
    properties = {
      forceUpdateTag = var.force_update_tag
      request = var.request == null ? null : {
        artifacts          = var.request.artifacts == null ? null : [for item in var.request.artifacts : item]
        catalogDigest      = var.request.catalog_digest
        pipelineResourceId = var.request.pipeline_resource_id
        source = var.request.source == null ? null : {
          name = var.request.source.name
          type = var.request.source.type
        }
        target = var.request.target == null ? null : {
          name = var.request.target.name
          type = var.request.target.type
        }
      }
    }
  }
}
