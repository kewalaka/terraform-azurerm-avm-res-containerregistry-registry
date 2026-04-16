# Azure Container Registry Import Pipelines Module

This module manages import pipelines for importing artifacts from external storage for an Azure Container Registry.

## Usage

```terraform
module "acr_import_pipelines" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/import_pipelines"

  name      = "my-import-pipeline"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  pipeline_source = {
    key_vault_uri = "https://myvault.vault.azure.net/secrets/mysecret"
    type          = "AzureStorageBlobContainer"
    uri           = "https://myaccount.blob.core.windows.net/mycontainer"
  }
}
```
