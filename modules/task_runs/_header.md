# Azure Container Registry Task Runs Module

This module manages task run operations for executing registry tasks for an Azure Container Registry.

## Usage

```terraform
module "acr_task_runs" {
  source = "Azure/avm-res-containerregistry-registry/azurerm//modules/task_runs"

  name      = "my-task-run"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerRegistry/registries/myRegistry"
  location  = "eastus"
  run_request = {
    type             = "DockerBuildRequest"
    docker_file_path = "Dockerfile"
    source_location  = "https://github.com/example/repo.git"
    platform = {
      os = "Linux"
    }
  }
}
```
