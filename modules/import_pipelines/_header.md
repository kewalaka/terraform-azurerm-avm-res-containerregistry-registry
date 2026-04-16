This submodule manages Azure Container Registry import pipelines (`Microsoft.ContainerRegistry/registries/importPipelines@2026-01-01-preview`).

## Usage

```terraform
module "import_pipelines" {
  source    = "./modules/import_pipelines"
  name      = "myImportPipeline"
  parent_id = azapi_resource.this.id
  location  = "eastus"
  pipeline_source = {
    key_vault_uri = "https://myvault.vault.azure.net/secrets/mysecret"
    type          = "AzureStorageBlobContainer"
    uri           = "https://myaccount.blob.core.windows.net/mycontainer"
  }
}
```
