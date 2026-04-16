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
  cache_rules = {
    nginx = {
      name              = "nginx-cache-rule"
      location          = azurerm_resource_group.this.location
      source_repository = "docker.io/library/nginx"
      target_repository = "nginx"
    }
    alpine = {
      name              = "alpine-cache-rule"
      location          = azurerm_resource_group.this.location
      source_repository = "docker.io/library/alpine"
      target_repository = "alpine"
    }
    dotnet-aspnet = {
      name              = "dotnet-aspnet-cache-rule"
      location          = azurerm_resource_group.this.location
      source_repository = "mcr.microsoft.com/dotnet/aspnet"
      target_repository = "dotnet/aspnet"
    }
  }
  sku = {
    name = "Premium"
  }
}
