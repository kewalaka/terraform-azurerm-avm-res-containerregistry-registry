# Upgrade Guide

## Upgrading to the AzAPI-based module

### Context

The module has been rewritten to use the AzAPI provider instead of azurerm for the core `azurerm_container_registry` resource. The AzAPI provider talks directly to the Azure ARM API, giving day-zero support for new features and a 1:1 mapping with the ARM schema. The azurerm provider is still used for locks, role assignments, diagnostic settings, and private endpoints.

### Breaking changes summary

- **Provider**: main resource is now `azapi_resource` (type `Microsoft.ContainerRegistry/registries@2026-01-01-preview`) instead of `azurerm_container_registry`.
- **`resource_group_name` removed**: replaced by `parent_id`, which takes the full ARM resource ID of the parent resource group.
- **`sku`**: changed from a string (`"Premium"`) to an object `{ name = "Premium" }`.
- **`admin_enabled`** → **`admin_user_enabled`**: renamed.
- **`zone_redundancy_enabled`** (bool) → **`zone_redundancy`** (string: `"Enabled"` or `"Disabled"`).
- **`public_network_access_enabled`** (bool) → **`public_network_access`** (string: `"Enabled"` or `"Disabled"`).
- **Policy variables consolidated**: `export_policy_enabled`, `quarantine_policy_enabled`, `retention_policy_in_days`, `enable_trust_policy` → single `policies` object with sub-objects for each policy.
- **`network_rule_bypass_option`** → **`network_rule_bypass_options`**: renamed.
- **`network_rule_set`** restructured: `ip_rule[].ip_range` → `ip_rules[].value`.
- **`georeplications`** (list) → **`replications`** (map of objects): now a child module, uses `name` + `location`, `zone_redundancy` is string not bool.
- **`scope_maps`** restructured: tokens no longer nested, now separate `tokens` variable.
- **`customer_managed_key`** → **`encryption`**: different structure using ARM property format.
- **Terraform**: `~> 1.12` required (was `>= 1.3.0`).
- **AzAPI provider**: `~> 2.7` required.
- **azurerm provider**: `>= 4, < 5.0.0` (unchanged).

### Variable mapping table

| Old variable (azurerm module) | New variable (AzAPI module) | Notes |
|---|---|---|
| `resource_group_name` | `parent_id` | Full ARM resource ID of the resource group |
| `location` | `location` | Unchanged |
| `name` | `name` | Unchanged |
| `tags` | `tags` | Unchanged |
| `enable_telemetry` | `enable_telemetry` | Unchanged |
| `lock` | `lock` | Unchanged |
| `role_assignments` | `role_assignments` | Unchanged |
| `diagnostic_settings` | `diagnostic_settings` | Unchanged |
| `managed_identities` | `managed_identities` | Unchanged |
| `private_endpoints` | `private_endpoints` | Unchanged |
| `sku` (string: `"Premium"`) | `sku` (object: `{ name = "Premium" }`) | Type changed |
| `admin_enabled` | `admin_user_enabled` | Renamed |
| `anonymous_pull_enabled` | `anonymous_pull_enabled` | Unchanged |
| `data_endpoint_enabled` | `data_endpoint_enabled` | Unchanged |
| `public_network_access_enabled` (bool) | `public_network_access` (string) | `true` → `"Enabled"`, `false` → `"Disabled"` |
| `zone_redundancy_enabled` (bool) | `zone_redundancy` (string) | `true` → `"Enabled"`, `false` → `"Disabled"` |
| `network_rule_bypass_option` | `network_rule_bypass_options` | Renamed (pluralized) |
| `network_rule_set` | `network_rule_set` | `ip_rule[].ip_range` → `ip_rules[].value` |
| `export_policy_enabled` | `policies.export_policy.status` | `true` → `"enabled"`, `false` → `"disabled"` |
| `quarantine_policy_enabled` | `policies.quarantine_policy.status` | `true` → `"enabled"`, `false` → `"disabled"` |
| `retention_policy_in_days` | `policies.retention_policy.days` + `.status` | Must also set status |
| `enable_trust_policy` | `policies.trust_policy.status` | `true` → `"enabled"`, `false` → `"disabled"` |
| `customer_managed_key` | `encryption` | Different structure (see migration examples) |
| `georeplications` (list) | `replications` (map) | Now a child module |
| `scope_maps` (with nested tokens) | `scope_maps` + `tokens` (separate) | Tokens decoupled |
| N/A | `policies.soft_delete_policy` | New |
| N/A | `policies.azure_ad_authentication_as_arm_policy` | New |
| N/A | `webhooks` | New — webhook support |
| N/A | `cache_rules` | New — cache rule support |
| N/A | `metadata_search` | New |
| N/A | `endpoint_protocol` | New |
| N/A | `regional_endpoints` | New |

### Migration examples

#### Resource group reference

```hcl
# Old
module "acr" {
  source = "Azure/avm-res-containerregistry-registry/azurerm"

  resource_group_name = "rg-example"
  # ...
}

# New
module "acr" {
  source = "Azure/avm-res-containerregistry-registry/azurerm"

  parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example"
  # ...
}
```

#### SKU

```hcl
# Old
sku = "Premium"

# New
sku = {
  name = "Premium"
}
```

#### Zone redundancy

```hcl
# Old
zone_redundancy_enabled = true

# New
zone_redundancy = "Enabled"
```

#### Public network access

```hcl
# Old
public_network_access_enabled = false

# New
public_network_access = "Disabled"
```

#### Policies

```hcl
# Old
export_policy_enabled     = true
quarantine_policy_enabled = false
retention_policy_in_days  = 7
enable_trust_policy       = false

# New
policies = {
  export_policy = {
    status = "enabled"
  }
  quarantine_policy = {
    status = "disabled"
  }
  retention_policy = {
    days   = 7
    status = "enabled"
  }
  trust_policy = {
    status = "disabled"
  }
}
```

#### Network rule set

```hcl
# Old
network_rule_set = {
  default_action = "Deny"
  ip_rule = [
    {
      action   = "Allow"
      ip_range = "10.0.0.0/24"
    }
  ]
}

# New
network_rule_set = {
  default_action = "Deny"
  ip_rules = [
    {
      action = "Allow"
      value  = "10.0.0.0/24"
    }
  ]
}
```

#### Customer managed key / Encryption

```hcl
# Old
customer_managed_key = {
  key_vault_resource_id = azurerm_key_vault.this.id
  key_name              = azurerm_key_vault_key.this.name
  user_assigned_identity = {
    resource_id = azurerm_user_assigned_identity.this.id
  }
}

# New
encryption = {
  key_vault_properties = {
    identity       = azurerm_user_assigned_identity.this.client_id
    key_identifier = azurerm_key_vault_key.this.id
  }
  status = "enabled"
}
```

#### Geo-replications / Replications

```hcl
# Old
georeplications = [
  {
    location                  = "australiaeast"
    regional_endpoint_enabled = true
    zone_redundancy_enabled   = true
  }
]

# New
replications = {
  australiaeast = {
    name                    = "australiaeast"
    location                = "australiaeast"
    region_endpoint_enabled = true
    zone_redundancy         = "Enabled"
  }
}
```

#### Scope maps and tokens

```hcl
# Old (tokens nested in scope_maps)
scope_maps = {
  readonly = {
    name    = "readonly-scope"
    actions = ["repositories/*/content/read"]
    registry_tokens = {
      reader = {
        name = "reader-token"
        passwords = {
          password1 = { expiry = "2025-12-31T00:00:00Z" }
        }
      }
    }
  }
}

# New (scope_maps and tokens are separate)
scope_maps = {
  readonly = {
    name        = "readonly-scope"
    location    = "australiaeast"
    actions     = ["repositories/*/content/read"]
    description = "Read-only scope"
  }
}

tokens = {
  reader = {
    name     = "reader-token"
    location = "australiaeast"
    # Construct the scope map ARM ID directly to avoid a circular reference
    # (the token is defined in the same module call as the scope map).
    scope_map_id = "${azurerm_resource_group.this.id}/providers/Microsoft.ContainerRegistry/registries/myregistry/scopeMaps/readonly-scope"
    credentials = {
      passwords = [
        { name = "password1", expiry = "2025-12-31T00:00:00Z" }
      ]
    }
  }
}
```

### New features

- **Day-zero ARM API support** — targets API version `2026-01-01-preview` directly.
- **Soft delete policy** — configure via `policies.soft_delete_policy`.
- **Azure AD authentication as ARM policy** — configure via `policies.azure_ad_authentication_as_arm_policy`.
- **Webhooks** — create webhooks on the registry via the `webhooks` variable.
- **Cache rules** — configure cache rules for upstream registries via `cache_rules`.
- **Metadata search** — enable artifact metadata indexing via `metadata_search`.
- **Endpoint protocol** — configure IPv4 or dual-stack connectivity via `endpoint_protocol`.
- **Regional endpoints** — enable per-region endpoints via `regional_endpoints`.

### State migration

```bash
# 1. Back up state
terraform state pull > terraform.tfstate.backup

# 2. Remove the old azurerm resource from state
terraform state rm 'module.acr.azurerm_container_registry.this'

# 3. Import into the new azapi resource
terraform import 'module.acr.azapi_resource.this' \
  '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.ContainerRegistry/registries/myregistry'

# 4. Migrate child resources — replications
#    Old: azurerm_container_registry_replication
#    New: child module using azapi_resource
terraform state rm 'module.acr.azurerm_container_registry_replication.this["<key>"]'
terraform import 'module.acr.module.replications["<key>"].azapi_resource.this' \
  '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.ContainerRegistry/registries/myregistry/replications/<replication_name>'

# 5. Migrate child resources — scope maps
#    Old: azurerm_container_registry_scope_map
#    New: child module using azapi_resource
terraform state rm 'module.acr.azurerm_container_registry_scope_map.this["<key>"]'
terraform import 'module.acr.module.scope_maps["<key>"].azapi_resource.this' \
  '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.ContainerRegistry/registries/myregistry/scopeMaps/<scope_map_name>'

# 6. Migrate child resources — tokens
#    Old: azurerm_container_registry_token
#    New: child module using azapi_resource
terraform state rm 'module.acr.azurerm_container_registry_token.this["<key>"]'
terraform import 'module.acr.module.tokens["<key>"].azapi_resource.this' \
  '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.ContainerRegistry/registries/myregistry/tokens/<token_name>'

# 7. Migrate child resources — webhooks
#    Old: azurerm_container_registry_webhook
#    New: child module using azapi_resource
terraform state rm 'module.acr.azurerm_container_registry_webhook.this["<key>"]'
terraform import 'module.acr.module.webhooks["<key>"].azapi_resource.this' \
  '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.ContainerRegistry/registries/myregistry/webhooks/<webhook_name>'

# 8. Run plan to verify — expect no destructive changes
terraform plan
```

> **Note:** Replace `<key>` with the Terraform map key used in your configuration and `<replication_name>`, `<scope_map_name>`, `<token_name>`, `<webhook_name>` with the actual Azure resource names. Repeat steps 4–7 for each instance of the respective child resource.

### Output changes

| Old output | New output | Notes |
|---|---|---|
| `resource_id` | `resource_id` | Unchanged |
| `name` | `name` | Unchanged |
| `resource` | `resource` | Now returns `azapi_resource.this` instead of `azurerm_container_registry.this` |
| `system_assigned_mi_principal_id` | `system_assigned_mi_principal_id` | Unchanged (now sourced from AzAPI output) |
| N/A | `identity_principal_id` | New (same value as `system_assigned_mi_principal_id`) |
| N/A | `identity_tenant_id` | New |
| N/A | `api_version` | New |
| N/A | `creation_date` | New |
| N/A | `data_endpoint_host_names` | New |
| N/A | `login_server` | New |
| N/A | `status` | New |
| N/A | `system_data` | New |
| N/A | `type` | New |
