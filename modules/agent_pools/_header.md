# Azure Container Registry Agent Pools Module

This module manages agent pools for an Azure Container Registry.

## Usage

```terraform
module "acr_agent_pools" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/agent_pools"

  name      = "example"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
}
```
