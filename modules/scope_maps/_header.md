# Azure Container Registry Scope Maps Module

This module defines fine-grained access control by mapping repository permissions to tokens for an Azure Container Registry.

## Usage

```terraform
module "acr_scope_maps" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/scope_maps"

  name      = "my-scope-map"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  actions   = ["repositories/myrepo/content/read"]
}
```