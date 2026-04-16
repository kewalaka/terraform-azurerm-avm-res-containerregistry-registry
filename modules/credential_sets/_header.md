# Azure Container Registry Credential Sets Module

This module manages credential sets for an Azure Container Registry.

## Usage

```terraform
module "acr_credential_sets" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/credential_sets"

  name      = "example"
  parent_id = "/subscriptions/.../providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
}
```
