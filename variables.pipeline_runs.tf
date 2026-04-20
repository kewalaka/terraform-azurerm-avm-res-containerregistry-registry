variable "pipeline_runs" {
  type = map(object({
    enable_telemetry = optional(bool)
    force_update_tag = optional(string)
    location         = string
    name             = string
    request = optional(object({
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
    }))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of pipeline run instances for the container registry with the following attributes:

**name**
The name of the pipeline run resource.

**location**
The location of the resource.

**force_update_tag**
How the pipeline run should be forced to recreate even if the pipeline run configuration has not changed.

**request**
The request parameters for a pipeline run.
- `artifacts` - List of source artifacts to be transferred by the pipeline.
- `catalog_digest` - The digest of the tar used to transfer the artifacts.
- `pipeline_resource_id` - The resource ID of the pipeline to run.
- `source` - The source properties of the pipeline run.
  - `name` - The name of the source.
  - `type` - The type of the source.
- `target` - The target properties of the pipeline run.
  - `name` - The name of the target.
  - `type` - The type of the target.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
}
