terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4, < 5.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
}

module "regions" {
  source                    = "Azure/avm-utl-regions/azurerm"
  version                   = "0.3.0"
  availability_zones_filter = true
}

resource "random_shuffle" "regions_with_zones" {
  input        = module.regions.valid_region_names
  result_count = 2
}

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = random_shuffle.regions_with_zones.result[0]
  name     = module.naming.resource_group.name_unique
}

resource "azurerm_user_assigned_identity" "this" {
  location            = azurerm_resource_group.this.location
  name                = module.naming.user_assigned_identity.name_unique
  resource_group_name = azurerm_resource_group.this.name
}

data "azurerm_client_config" "this" {}

resource "azurerm_key_vault" "this" {
  location                   = azurerm_resource_group.this.location
  name                       = module.naming.key_vault.name_unique
  resource_group_name        = azurerm_resource_group.this.name
  sku_name                   = "premium"
  tenant_id                  = data.azurerm_client_config.this.tenant_id
  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  access_policy {
    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "Purge",
      "List",
      "Recover",
      "Update",
      "GetRotationPolicy",
      "SetRotationPolicy"
    ]
    object_id = data.azurerm_client_config.this.object_id
    tenant_id = data.azurerm_client_config.this.tenant_id
  }
  access_policy {
    key_permissions = [
      "Get",
      "Create",
      "List",
      "Restore",
      "Recover",
      "UnwrapKey",
      "WrapKey",
      "Purge",
      "Encrypt",
      "Decrypt",
      "Sign",
      "Verify",
    ]
    object_id = azurerm_user_assigned_identity.this.principal_id
    secret_permissions = [
      "Get",
    ]
    tenant_id = data.azurerm_client_config.this.tenant_id
  }
}

resource "azurerm_key_vault_key" "key" {
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  key_type     = "RSA"
  key_vault_id = azurerm_key_vault.this.id
  name         = "generated-certificate"
  key_size     = 2048

  rotation_policy {
    expire_after         = "P90D"
    notify_before_expiry = "P29D"

    automatic {
      time_before_expiry = "P30D"
    }
  }
}

# A vnet is required for the private endpoint.
resource "azurerm_virtual_network" "this" {
  address_space       = ["192.168.0.0/24"]
  location            = azurerm_resource_group.this.location
  name                = module.naming.virtual_network.name_unique
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  address_prefixes     = ["192.168.0.0/24"]
  name                 = module.naming.subnet.name_unique
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
}

resource "azurerm_private_dns_zone" "this" {
  name                = "privatelink.azurecr.io"
  resource_group_name = azurerm_resource_group.this.name
}

# This is the module call
module "containerregistry" {
  source = "../../"
  # source             = "Azure/avm-containerregistry-registry/azurerm"
  name                          = module.naming.container_registry.name_unique
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  public_network_access_enabled = false

  managed_identities = {
    system_assigned            = true
    user_assigned_resource_ids = toset([azurerm_user_assigned_identity.this.id])
  }

  customer_managed_key = {
    key_vault_resource_id = azurerm_key_vault.this.id
    key_name              = azurerm_key_vault_key.key.name
    user_assigned_identity = {
      resource_id = azurerm_user_assigned_identity.this.id
    }
  }

  georeplications = [
    {
      location = random_shuffle.regions_with_zones.result[0]
      # zone redundancy is enabled by default, and is supported in australia east
      tags = {
        environment = "prod"
        department  = "engineering"
      }
    },
    {
      location                = random_shuffle.regions_with_zones.result[1]
      zone_redundancy_enabled = false
      tags = {
        environment = "pre-prod"
        department  = "engineering"
      }
    }
  ]

  network_rule_set = {
    default_action = "Deny"
    virtual_network_rules = [
      {
        action                      = "Allow"
        virtual_network_resource_id = azurerm_subnet.this.id
      }
    ]
  }
  network_rule_bypass_option = "AzureServices"

  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [azurerm_private_dns_zone.this.id]
      subnet_resource_id            = azurerm_subnet.this.id
    }
  }
}
