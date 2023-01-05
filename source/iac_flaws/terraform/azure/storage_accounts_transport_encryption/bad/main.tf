# fail

resource "azurerm_storage_account" "disabled" {
  name                     = "storageaccountname"
  resource_group_name      = "azurerm_resource_group.example.name"
  location                 = "azurerm_resource_group.example.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  enable_https_traffic_only = false
}
