variable "import_pipelines" {
  type = map(object({
    enable_telemetry = optional(bool)
    location         = string
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name    = string
    options = optional(list(any))
    pipeline_source = object({
      key_vault_uri       = optional(string)
      storage_access_mode = optional(any)
      type                = optional(any)
      uri                 = optional(string)
    })
    trigger = optional(object({
      source_trigger = optional(object({
        status = any
      }))
    }))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**name**
The name of the resource.

**location**
The location of the resource.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**managed_identities**
Controls the Managed Identity configuration on this resource.

**options**
The list of all options configured for the pipeline.

**pipeline_source**
The source properties of the import pipeline.
- `key_vault_uri` - The key vault secret uri to obtain the source storage SAS token.
- `storage_access_mode` - The storage access mode used for the customer storage account.
- `type` - The type of source for the import pipeline.
- `uri` - The source uri of the import pipeline. When 'AzureStorageBlob': "https://accountName.blob.core.windows.net/containerName/blobName" When 'AzureStorageBlobContainer': "https://accountName.blob.core.windows.net/containerName"

**trigger**
The properties that describe the trigger of the import pipeline.
- `source_trigger` - The source trigger properties of the pipeline.
  - `status` - The current status of the source trigger.
DESCRIPTION
}
