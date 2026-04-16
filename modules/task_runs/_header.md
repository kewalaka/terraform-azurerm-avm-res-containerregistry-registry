# Task Runs submodule

This submodule manages task runs for an Azure Container Registry (`Microsoft.ContainerRegistry/registries/taskRuns@2025-03-01-preview`).

## Usage

```hcl
module "task_runs" {
  source = "./modules/task_runs"

  name      = "example-task-run"
  parent_id = azapi_resource.container_registry.id
  location  = "eastus"
  run_request = {
    type          = "DockerBuildRequest"
    docker_file_path = "Dockerfile"
    source_location  = "https://github.com/example/repo.git"
    platform = {
      os = "Linux"
    }
  }
}
```
