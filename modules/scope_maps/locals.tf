locals {
  resource_body = {
    name = var.name
    properties = {
      actions     = var.actions == null ? null : [for item in var.actions : item]
      description = var.description
    }
  }
}
