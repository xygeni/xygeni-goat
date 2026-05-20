resource "azurerm_sql_server" "bad" {
  # ...
  administrator_login          = ""
  administrator_login_password = ""
  location                     = ""
  name                         = ""
  resource_group_name          = ""
  version                      = ""
}

resource "azurerm_mssql_server" "bad" {
  # ...
  administrator_login          = ""
  administrator_login_password = ""
  location                     = ""
  name                         = ""
  resource_group_name          = ""
  version                      = ""
}
