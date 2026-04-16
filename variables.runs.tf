variable "runs" {
  type = map(object({
    name = string
  }))
  default     = {}
  description = <<DESCRIPTION
Map of run instances for the container registry with the following attributes:

**name**
The name of the run resource.
DESCRIPTION
}
