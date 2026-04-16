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

# tflint-ignore: terraform_unused_declarations
variable "tags" {
  description = <<DESCRIPTION
(Optional) Tags of the resource.
DESCRIPTION
  type        = map(string)
  default     = null
}

variable "actions" {
  description = <<DESCRIPTION
The list of actions that trigger the webhook to post notifications.
DESCRIPTION
  type        = list(any)
}

variable "custom_headers" {
  description = <<DESCRIPTION
Custom headers that will be added to the webhook notifications.
DESCRIPTION
  type        = map(string)
  default     = null
  ephemeral   = true
}

variable "scope" {
  description = <<DESCRIPTION
The scope of repositories where the event can be triggered. For example, 'foo:*' means events for all tags under repository 'foo'. 'foo:bar' means events for 'foo:bar' only. 'foo' is equivalent to 'foo:latest'. Empty means all events.
DESCRIPTION
  type        = string
  default     = null
}

variable "service_uri" {
  description = <<DESCRIPTION
The service URI for the webhook to post notifications.
DESCRIPTION
  type        = string
  ephemeral   = true
}

variable "status" {
  description = <<DESCRIPTION
The status of the webhook at the time the operation was called.
DESCRIPTION
  type        = any
  default     = null
}


variable "custom_headers_version" {
  description = <<DESCRIPTION
Version tracker for custom_headers. Must be set when custom_headers is provided.
DESCRIPTION
  type        = number
  default     = null
  validation {
    condition     = var.custom_headers == null || var.custom_headers_version != null
    error_message = "When custom_headers is set, custom_headers_version must also be set."
  }
}

variable "service_uri_version" {
  description = <<DESCRIPTION
Version tracker for service_uri. Must be set when service_uri is provided.
DESCRIPTION
  type        = number
  default     = null
  validation {
    condition     = var.service_uri == null || var.service_uri_version != null
    error_message = "When service_uri is set, service_uri_version must also be set."
  }
}

variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

