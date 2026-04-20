# Azure Container Registry Export Pipelines Module

This module manages export pipelines for transferring artifacts to external storage for an Azure Container Registry.

## Usage

```terraform
module "acr_export_pipelines" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/export_pipelines"

  name      = "my-export-pipeline"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  target = {
    key_vault_uri = "https://myvault.vault.azure.net/secrets/mysecret"
    type          = "AzureStorageBlobContainer"
    uri           = "https://myaccount.blob.core.windows.net/mycontainer"
  }
}
```
