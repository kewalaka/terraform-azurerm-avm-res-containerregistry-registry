# Runs Submodule

This submodule manages runs for an Azure Container Registry (`Microsoft.ContainerRegistry/registries/runs@2025-03-01-preview`).

## Usage

```hcl
module "runs" {
  source = "./modules/runs"

  name      = "example-run"
  parent_id = azapi_resource.registry.id
  location  = "eastus"
}
```
