variable "webhooks" {
  type = map(object({
    actions                = list(any)
    custom_headers         = optional(map(string))
    custom_headers_version = optional(number)
    enable_telemetry       = optional(bool)
    location               = string
    name                   = string
    scope                  = optional(string)
    service_uri            = string
    service_uri_version    = optional(number)
    status                 = optional(any)
    tags                   = optional(map(string))
  }))
  default     = {}
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**location**
The location of the resource.

**actions**
The list of actions that trigger the webhook to post notifications.

**custom_headers**
Custom headers that will be added to the webhook notifications.

**scope**
The scope of repositories where the event can be triggered. For example, 'foo:*' means events for all tags under repository 'foo'. 'foo:bar' means events for 'foo:bar' only. 'foo' is equivalent to 'foo:latest'. Empty means all events.

**service_uri_version**
Version tracker for service_uri. Must be set when service_uri is provided.

**name**
The name of the resource.

**tags**
(Optional) Tags of the resource.

**service_uri**
The service URI for the webhook to post notifications.

**status**
The status of the webhook at the time the operation was called.

**custom_headers_version**
Version tracker for custom_headers. Must be set when custom_headers is provided.
DESCRIPTION
}
