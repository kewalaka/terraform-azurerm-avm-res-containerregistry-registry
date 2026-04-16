# Azure Container Registry Tasks Module

This module manages tasks for an Azure Container Registry.

## Usage

```terraform
module "acr_tasks" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/tasks"

  name      = "example"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
}
```
