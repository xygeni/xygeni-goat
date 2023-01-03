resource "azurerm_key_vault" "good" {
  name                       = "my_key_vault"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"

  enabled_for_disk_encryption = true
  purge_protection_enabled    = true # FIXED
  soft_delete_retention_days  = 7 # 90 is the default, 7 the minimum

  # access_policy ...
}

#

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

