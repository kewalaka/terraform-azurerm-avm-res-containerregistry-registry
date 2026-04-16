variable "location" {
  type        = string
  description = <<DESCRIPTION
The location of the resource.
DESCRIPTION
}

variable "name" {
  type        = string
  description = <<DESCRIPTION
The name of the resource.
DESCRIPTION
}

variable "parent_id" {
  type        = string
  description = <<DESCRIPTION
The parent resource ID for this resource.
DESCRIPTION
}

variable "target" {
  type = object({
    key_vault_uri       = optional(string)
    storage_access_mode = optional(any)
    type                = optional(string)
    uri                 = optional(string)
  })
  description = <<DESCRIPTION
The target properties of the export pipeline.

- `key_vault_uri` - They key vault secret uri to obtain the target storage SAS token.
- `storage_access_mode` - The storage access mode used for the customer storage account.
- `type` - The type of target for the export pipeline.
- `uri` - The target uri of the export pipeline. When 'AzureStorageBlob': "https://accountName.blob.core.windows.net/containerName/blobName" When 'AzureStorageBlobContainer':  "https://accountName.blob.core.windows.net/containerName"

DESCRIPTION
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  nullable    = false
}

# tflint-ignore: terraform_unused_declarations
variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource.
DESCRIPTION
  nullable    = false
}

variable "options" {
  type        = list(any)
  default     = null
  description = <<DESCRIPTION
The list of all options configured for the pipeline.
DESCRIPTION
}
