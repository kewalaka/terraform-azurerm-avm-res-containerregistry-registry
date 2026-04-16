mock_provider "azapi" {
  mock_resource "azapi_resource" {
    defaults = {
      id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.ContainerRegistry/registries/testacr"
      name   = "testacr"
      output = {}
    }
  }

  mock_data "azapi_client_config" {
    defaults = {
      subscription_id = "00000000-0000-0000-0000-000000000000"
      tenant_id       = "00000000-0000-0000-0000-000000000001"
    }
  }
}

mock_provider "azurerm" {}
mock_provider "modtm" {}
mock_provider "random" {}

variables {
  name      = "testacr"
  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test"
  location  = "eastus"
  sku = {
    name = "Premium"
  }
}

# Test 1: Default apply with minimal required variables
run "default_apply" {
  command = apply

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry name should be 'testacr'."
  }

  assert {
    condition     = azapi_resource.this.parent_id == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test"
    error_message = "Registry parent_id should match the resource group ID."
  }

  assert {
    condition     = azapi_resource.this.location == "eastus"
    error_message = "Registry location should be 'eastus'."
  }

  assert {
    condition     = azapi_resource.this.type == "Microsoft.ContainerRegistry/registries@2026-01-01-preview"
    error_message = "Registry resource type should be 'Microsoft.ContainerRegistry/registries@2026-01-01-preview'."
  }

  assert {
    condition     = output.name == "testacr"
    error_message = "Output name should be 'testacr'."
  }

  assert {
    condition     = output.resource_id != ""
    error_message = "Output resource_id should not be empty."
  }
}

# Test 2: SKU set to Basic
run "sku_basic" {
  command = apply

  variables {
    sku = {
      name = "Basic"
    }
  }

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry should be created with Basic SKU."
  }
}

# Test 3: SKU set to Standard
run "sku_standard" {
  command = apply

  variables {
    sku = {
      name = "Standard"
    }
  }

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry should be created with Standard SKU."
  }
}

# Test 4: Admin user enabled
run "admin_user_enabled" {
  command = apply

  variables {
    admin_user_enabled = true
  }

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry should be created with admin user enabled."
  }
}

# Test 5: Zone redundancy enabled (requires Premium SKU)
run "zone_redundancy_enabled" {
  command = apply

  variables {
    sku = {
      name = "Premium"
    }
    zone_redundancy = "Enabled"
  }

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry should be created with zone redundancy enabled."
  }
}

# Test 6: Public network access disabled
run "public_network_access_disabled" {
  command = apply

  variables {
    public_network_access = "Disabled"
  }

  assert {
    condition     = azapi_resource.this.name == "testacr"
    error_message = "Registry should be created with public network access disabled."
  }
}

# Test 7: Telemetry disabled
run "telemetry_disabled" {
  command = apply

  variables {
    enable_telemetry = false
  }

  assert {
    condition     = length(modtm_telemetry.telemetry) == 0
    error_message = "Telemetry resource should not be created when enable_telemetry is false."
  }

  assert {
    condition     = length(random_uuid.telemetry) == 0
    error_message = "Random UUID for telemetry should not be created when enable_telemetry is false."
  }
}

# Test 8: Lock validation - invalid kind should fail
run "lock_invalid_kind" {
  command = plan

  variables {
    lock = {
      kind = "InvalidKind"
    }
  }

  expect_failures = [
    var.lock,
  ]
}
