locals {
  resource_body = {
    properties = {
      actions     = var.actions == null ? null : [for item in var.actions : item]
      description = var.description
    }
  }
}
