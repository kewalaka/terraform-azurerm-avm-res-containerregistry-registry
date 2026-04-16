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

variable "agent_count" {
  description = <<DESCRIPTION
The count of agent machine
DESCRIPTION
  type        = number
  default     = null
}

variable "os" {
  description = <<DESCRIPTION
The OS of agent machine
DESCRIPTION
  type        = any
  default     = null
}

variable "tier" {
  description = <<DESCRIPTION
The Tier of agent machine
DESCRIPTION
  type        = string
  default     = null
}

variable "virtual_network_subnet_resource_id" {
  description = <<DESCRIPTION
The Virtual Network Subnet Resource Id of the agent machine
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

