variable "actions" {
  type        = list(any)
  description = <<DESCRIPTION
The list of actions that trigger the webhook to post notifications.
DESCRIPTION
}

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

variable "service_uri" {
  type        = string
  ephemeral   = true
  description = <<DESCRIPTION
The service URI for the webhook to post notifications.
DESCRIPTION
}

variable "custom_headers" {
  type        = map(string)
  ephemeral   = true
  default     = null
  description = <<DESCRIPTION
Custom headers that will be added to the webhook notifications.
DESCRIPTION
}

variable "custom_headers_version" {
  type        = number
  default     = null
  description = <<DESCRIPTION
Version tracker for custom_headers. Must be set when custom_headers is provided.
DESCRIPTION

  validation {
    condition     = var.custom_headers == null || var.custom_headers_version != null
    error_message = "When custom_headers is set, custom_headers_version must also be set."
  }
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  nullable    = false
}

variable "scope" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The scope of repositories where the event can be triggered. For example, 'foo:*' means events for all tags under repository 'foo'. 'foo:bar' means events for 'foo:bar' only. 'foo' is equivalent to 'foo:latest'. Empty means all events.
DESCRIPTION
}

variable "service_uri_version" {
  type        = number
  default     = null
  description = <<DESCRIPTION
Version tracker for service_uri. Must be set when service_uri is provided.
DESCRIPTION

  validation {
    condition     = var.service_uri == null || var.service_uri_version != null
    error_message = "When service_uri is set, service_uri_version must also be set."
  }
}

variable "status" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The status of the webhook at the time the operation was called.
DESCRIPTION
}

# tflint-ignore: terraform_unused_declarations
variable "tags" {
  type        = map(string)
  default     = null
  description = <<DESCRIPTION
(Optional) Tags of the resource.
DESCRIPTION
}
