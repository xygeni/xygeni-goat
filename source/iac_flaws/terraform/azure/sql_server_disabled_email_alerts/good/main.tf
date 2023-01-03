resource "azurerm_mssql_server_security_alert_policy" "good" {
  resource_group_name        = azurerm_resource_group.example.name
  server_name                = azurerm_sql_server.example.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  disabled_alerts = []
  email_addresses = ["example@gmail.com"] # FIXED
  retention_days = 20
}

