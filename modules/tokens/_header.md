# Azure Container Registry Tokens Module

This module creates authentication tokens scoped to specific repositories using scope maps for an Azure Container Registry.

## Usage

```terraform
module "acr_tokens" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/tokens"

  name         = "my-token"
  parent_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location     = "eastus"
  scope_map_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry/scopeMaps/myScopeMap"
}
```