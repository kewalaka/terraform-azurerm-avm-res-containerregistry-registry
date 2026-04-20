# Azure Container Registry Connected Registries Module

This module manages connected registries for an Azure Container Registry.

## Usage

```terraform
module "acr_connected_registries" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/connected_registries"

  name      = "example"
  parent_id = "/subscriptions/.../providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  mode      = "ReadOnly"

  parent = {
    sync_properties = {
      message_ttl = "P1D"
      token_id    = "/subscriptions/.../providers/Microsoft.ContainerRegistry/registries/myRegistry/tokens/myToken"
    }
  }
}
```
