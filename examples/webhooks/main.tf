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

  webhooks = {
    push_notification = {
      actions             = ["push"]
      location            = azurerm_resource_group.this.location
      name                = "pushwebhook"
      scope               = "myapp:*"
      service_uri         = "https://example.com/webhook/push"
      service_uri_version = 1
    }
    delete_notification = {
      actions             = ["delete"]
      location            = azurerm_resource_group.this.location
      name                = "deletewebhook"
      service_uri         = "https://example.com/webhook/delete"
      service_uri_version = 1
    }
    cicd_notification = {
      actions  = ["push", "chart_push"]
      location = azurerm_resource_group.this.location
      name     = "cicdwebhook"
      custom_headers = {
        "Authorization" = "Bearer example-token"
        "Content-Type"  = "application/json"
      }
      custom_headers_version = 1
      service_uri            = "https://example.com/webhook/cicd"
      service_uri_version    = 1
    }
  }
}
