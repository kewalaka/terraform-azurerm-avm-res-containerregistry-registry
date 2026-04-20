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

variable "agent_count" {
  type        = number
  default     = null
  description = <<DESCRIPTION
The count of agent machine
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

variable "os" {
  type        = any
  default     = null
  description = <<DESCRIPTION
The OS of agent machine
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

variable "tier" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The Tier of agent machine
DESCRIPTION
}

variable "virtual_network_subnet_resource_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The Virtual Network Subnet Resource Id of the agent machine
DESCRIPTION
}
