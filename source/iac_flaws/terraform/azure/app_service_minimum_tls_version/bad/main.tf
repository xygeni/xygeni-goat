resource "azurerm_app_service" "bad" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  site_config {
    min_tls_version = "1.1" # FLAW, expected 1.2
  }
}