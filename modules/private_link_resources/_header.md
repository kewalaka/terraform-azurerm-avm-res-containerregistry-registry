# Private Link Resources submodule

This submodule manages private link resources for an Azure Container Registry (`Microsoft.ContainerRegistry/registries/privateLinkResources@2026-01-01-preview`).

## Usage

```hcl
module "private_link_resources" {
  source = "./modules/private_link_resources"

  name      = "registry"
  parent_id = azapi_resource.container_registry.id
  location  = "eastus"
}
```
