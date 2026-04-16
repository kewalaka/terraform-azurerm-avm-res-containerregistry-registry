locals {
  resource_body = {
    name = var.name
    properties = {
      actions = var.actions == null ? null : [for item in var.actions : item]
      scope   = var.scope
      status  = var.status
    }
    tags = var.tags == null ? null : { for k, value in var.tags : k => value }
  }
}
