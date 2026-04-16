# Azure Container Registry Cache Rules Module

This module configures registry cache rules that pull images from upstream repositories for an Azure Container Registry.

## Usage

```terraform
module "acr_cache_rules" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/cache_rules"

  name              = "my-cache-rule"
  parent_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location          = "eastus"
  source_repository = "docker.io/library/nginx"
  target_repository = "nginx"
}
```