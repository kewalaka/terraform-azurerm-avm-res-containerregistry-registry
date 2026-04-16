variable "scope_maps" {
  description = <<DESCRIPTION
Map of instances for the submodule with the following attributes:

**location**
The location of the resource.

**actions**
The list of scoped permissions for registry artifacts.
E.g. repositories/repository-name/content/read,
repositories/repository-name/metadata/write

**description**
The user friendly description of the scope map.

**enable_telemetry**
This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.

**name**
The name of the resource.
DESCRIPTION
  type = map(object({
    actions          = list(string)
    description      = optional(string)
    enable_telemetry = optional(bool)
    location         = string
    name             = string
  }))
  default = {}
}
