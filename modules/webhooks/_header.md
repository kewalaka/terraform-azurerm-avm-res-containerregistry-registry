# Azure Container Registry Webhooks Module

This module creates webhooks that send notifications when registry events occur (push, delete, etc.) for an Azure Container Registry.

## Usage

```terraform
module "acr_webhooks" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/webhooks"

  name        = "my-webhook"
  parent_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location    = "eastus"
  service_uri = "https://example.com/webhook"
  actions     = ["push"]
}
```