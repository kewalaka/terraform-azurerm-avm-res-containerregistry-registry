variable "name" {
  description = <<DESCRIPTION
The name of the resource.
DESCRIPTION
  type        = string
}

variable "parent_id" {
  description = <<DESCRIPTION
The parent resource ID for this resource.
DESCRIPTION
  type        = string
}

variable "location" {
  description = <<DESCRIPTION
The location of the resource.
DESCRIPTION
  type        = string
}

variable "force_update_tag" {
  description = <<DESCRIPTION
How the pipeline run should be forced to recreate even if the pipeline run configuration has not changed.
DESCRIPTION
  type        = string
  default     = null
}

variable "request" {
  description = <<DESCRIPTION
The request parameters for a pipeline run.

- `artifacts` - List of source artifacts to be transferred by the pipeline.  Specify an image by repository ('hello-world'). This will use the 'latest' tag. Specify an image by tag ('hello-world:latest'). Specify an image by sha256-based manifest digest ('hello-world@sha256:abc123').
- `catalog_digest` - The digest of the tar used to transfer the artifacts.
- `pipeline_resource_id` - The resource ID of the pipeline to run.
- `source` - The source properties of the pipeline run.
  - `name` - The name of the source.
  - `type` - The type of the source.
- `target` - The target properties of the pipeline run.
  - `name` - The name of the target.
  - `type` - The type of the target.

DESCRIPTION
  type = object({
    artifacts            = optional(list(string))
    catalog_digest       = optional(string)
    pipeline_resource_id = optional(string)
    source = optional(object({
      name = optional(string)
      type = optional(any)
    }))
    target = optional(object({
      name = optional(string)
      type = optional(any)
    }))
  })
  default = null
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

