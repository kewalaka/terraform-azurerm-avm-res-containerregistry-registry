variable "private_link_resources" {
  type = map(object({
    name = string
  }))
  default     = {}
  description = <<DESCRIPTION
Map of private link resource instances for the container registry with the following attributes:

**name**
The name of the private link resource.
DESCRIPTION
}
