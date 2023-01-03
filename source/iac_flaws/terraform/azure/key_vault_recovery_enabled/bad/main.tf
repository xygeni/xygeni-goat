# No purge_protection_enabled
resource "azurerm_key_vault" "bad_no_purge_protection" { # <1> FLAW
  name                       = "my_key_vault"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"

  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7

  # access_policy ...
}

resource "azurerm_key_vault" "bad_no_soft_delete" {
  name                        = "my_key_vault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_enabled         = false # <1> FLAW (deprecated attribute, default=true)

  # access_policy ...
}
#

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

