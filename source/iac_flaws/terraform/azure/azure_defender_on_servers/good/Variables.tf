variable security_center_resource_types {
  description = "List of security center resource types to configure"
  type        = list(string)
  default = [
    "VirtualMachines",
    "AppServices",
    "KeyVaults",
    "SqlServers",
    "SqlServerVirtualMachines",
    "StorageAccounts",
    "Arm",
    "Dns",
    "Containers",
    "OpenSourceRelationalDatabases"
  ]
}

variable free_service {
  description = "Service wants to break free"
  type = string
  default = "AppServices"
}

variable free_service_2 {
  description = "Service wants to break free"
  type = string
  default = "VirtualMachines"
}