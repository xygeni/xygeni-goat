resource "azurerm_mariadb_server" "good" {
  name                = var.server_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ssl_enforcement_enabled = true # FIXED

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "10.2"
  auto_grow_enabled             = true
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = false
}

variable "server_name" {
  default = "db_server"
}

variable "resource_group" {
  default = {
    name     = "example-resources"
    location = "West Europe"
  }
}