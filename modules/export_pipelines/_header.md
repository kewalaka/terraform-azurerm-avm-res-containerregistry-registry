This submodule manages Azure Container Registry export pipelines (`Microsoft.ContainerRegistry/registries/exportPipelines@2026-01-01-preview`).

## Usage

```terraform
module "export_pipelines" {
  source    = "./modules/export_pipelines"
  name      = "myExportPipeline"
  parent_id = azapi_resource.this.id
  location  = "eastus"
  target = {
    key_vault_uri = "https://myvault.vault.azure.net/secrets/mysecret"
    type          = "AzureStorageBlobContainer"
    uri           = "https://myaccount.blob.core.windows.net/mycontainer"
  }
}
```
