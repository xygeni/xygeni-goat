resource "azurerm_sql_server" "good" {
  # ...
  extended_auditing_policy {
    storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 90
  }
  administrator_login          = ""
  administrator_login_password = ""
  location                     = ""
  name                         = ""
  resource_group_name          = ""
  version                      = ""
}

resource "azurerm_mssql_server" "good" {
  # ...
  extended_auditing_policy {
    storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 90
  }
  administrator_login          = ""
  administrator_login_password = ""
  location                     = ""
  name                         = ""
  resource_group_name          = ""
  version                      = ""
}

resource "azurerm_sql_server" "good_2" {
  # ...
  administrator_login          = ""
  administrator_login_password = ""
  location                     = ""
  name                         = ""
  resource_group_name          = ""
  version                      = ""
}

resource "azurerm_mssql_server_extended_auditing_policy" "example_policy" {
  server_id = azurerm_sql_server.good_2.id
  # ...
  storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  storage_account_access_key_is_secondary = true
  retention_in_days          = 90
}
