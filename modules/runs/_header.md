# Azure Container Registry Runs Module

This module manages container registry task runs for building and pushing images for an Azure Container Registry.

## Usage

```terraform
module "acr_runs" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/runs"

  name      = "my-run"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  platform = {
    os = "Linux"
  }
}
```
