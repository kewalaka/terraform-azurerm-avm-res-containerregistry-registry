# Azure Container Registry Geo-Replications Module

This module creates geo-replicated copies of the container registry in additional Azure regions for an Azure Container Registry.

## Usage

```terraform
module "acr_replications" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/replications"

  name      = "westeurope"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "westeurope"
}
```