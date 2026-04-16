variable "export_pipelines" {
  type = map(object({
    enable_telemetry = optional(bool)
    location         = string
    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))
    name    = string
    options = optional(list(any))
    target = object({
      key_vault_uri       = optional(string)
      storage_access_mode = optional(any)
      type                = optional(string)
      uri                 = optional(string)
    })
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

**target**
The target properties of the export pipeline.
- `key_vault_uri` - The key vault secret uri to obtain the target storage SAS token.
- `storage_access_mode` - The storage access mode used for the customer storage account.
- `type` - The type of target for the export pipeline.
- `uri` - The target uri of the export pipeline. When 'AzureStorageBlob': "https://accountName.blob.core.windows.net/containerName/blobName" When 'AzureStorageBlobContainer': "https://accountName.blob.core.windows.net/containerName"
DESCRIPTION
}
