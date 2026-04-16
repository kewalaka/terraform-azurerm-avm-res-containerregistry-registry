# Pipeline Runs Submodule

This submodule manages pipeline runs for an Azure Container Registry (`Microsoft.ContainerRegistry/registries/pipelineRuns@2026-01-01-preview`).

## Usage

```hcl
module "pipeline_runs" {
  source = "./modules/pipeline_runs"

  name      = "example-pipeline-run"
  parent_id = azapi_resource.registry.id
  location  = "eastus"

  request = {
    pipeline_resource_id = "/subscriptions/.../importPipelines/example"
    artifacts            = ["hello-world:latest"]
  }
}
```
