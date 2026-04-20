# Azure Container Registry Pipeline Runs Module

This module manages pipeline run operations for import/export pipelines for an Azure Container Registry.

## Usage

```terraform
module "acr_pipeline_runs" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/pipeline_runs"

  name      = "my-pipeline-run"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  request = {
    pipeline_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry/importPipelines/example"
    artifacts            = ["hello-world:latest"]
  }
}
```
