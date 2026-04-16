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

variable "actions" {
  description = <<DESCRIPTION
The list of scoped permissions for registry artifacts.
E.g. repositories/repository-name/content/read,
repositories/repository-name/metadata/write
DESCRIPTION
  type        = list(string)
}

variable "description" {
  description = <<DESCRIPTION
The user friendly description of the scope map.
DESCRIPTION
  type        = string
  default     = null
}


variable "enable_telemetry" {
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.
DESCRIPTION
  type        = bool
  default     = true
  nullable    = false
}

