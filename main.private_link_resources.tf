module "private_link_resources" {
  source   = "./modules/private_link_resources"
  for_each = var.private_link_resources

  name      = each.value.name
  parent_id = azapi_resource.this.id
}
