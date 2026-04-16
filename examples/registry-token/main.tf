terraform {
  required_version = "~> 1.12"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.7"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4, < 5.0.0"
    }
  }
}

provider "azapi" {}

provider "azurerm" {
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
}

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = "australiaeast"
  name     = module.naming.resource_group.name_unique
}

# This is the module call
module "containerregistry" {
  source = "../../"

  location  = azurerm_resource_group.this.location
  name      = module.naming.container_registry.name_unique
  parent_id = azurerm_resource_group.this.id
  sku = {
    name = "Premium"
  }
  # Create scope maps for different access levels
  scope_maps = {
    readonly = {
      name     = "readonly-scope"
      location = azurerm_resource_group.this.location
      actions = [
        "repositories/*/content/read",
        "repositories/*/metadata/read"
      ]
      description = "Read-only access to all repositories"
    }
    devops = {
      name     = "devops-scope"
      location = azurerm_resource_group.this.location
      actions = [
        "repositories/*/content/read",
        "repositories/*/content/write",
        "repositories/*/content/delete",
        "repositories/*/metadata/read",
        "repositories/*/metadata/write"
      ]
      description = "Full access for DevOps teams"
    }
    cicd = {
      name     = "cicd-scope"
      location = azurerm_resource_group.this.location
      actions = [
        "repositories/myapp/content/read",
        "repositories/myapp/content/write"
      ]
      description = "CI/CD pipeline access for specific repositories"
    }
  }
  # Tokens are now a separate variable, referencing scope maps by constructed ARM resource ID
  tokens = {
    readonly_token = {
      name         = "readonly-token"
      location     = azurerm_resource_group.this.location
      scope_map_id = "${azurerm_resource_group.this.id}/providers/Microsoft.ContainerRegistry/registries/${module.naming.container_registry.name_unique}/scopeMaps/readonly-scope"
      status       = "enabled"
      credentials = {
        passwords = [
          {
            name   = "password1"
            expiry = "2025-12-31T00:00:00Z"
          }
        ]
      }
    }
    devops_token1 = {
      name         = "devops-token1"
      location     = azurerm_resource_group.this.location
      scope_map_id = "${azurerm_resource_group.this.id}/providers/Microsoft.ContainerRegistry/registries/${module.naming.container_registry.name_unique}/scopeMaps/devops-scope"
      status       = "enabled"
      credentials = {
        passwords = [
          {
            name   = "password1"
            expiry = "2025-12-31T00:00:00Z"
          },
          {
            name   = "password2"
            expiry = "2026-12-31T00:00:00Z"
          }
        ]
      }
    }
    devops_token2 = {
      name         = "devops-token2"
      location     = azurerm_resource_group.this.location
      scope_map_id = "${azurerm_resource_group.this.id}/providers/Microsoft.ContainerRegistry/registries/${module.naming.container_registry.name_unique}/scopeMaps/devops-scope"
      status       = "enabled"
    }
  }
}
