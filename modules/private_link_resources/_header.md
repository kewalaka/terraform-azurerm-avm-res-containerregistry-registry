# Azure Container Registry Private Link Resources Module

This module manages private link resources for private endpoint connectivity for an Azure Container Registry.

## Usage

```terraform
module "acr_private_link_resources" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/private_link_resources"

  name      = "registry"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  required_zone_names = ["privatelink.azurecr.io"]
}
```
