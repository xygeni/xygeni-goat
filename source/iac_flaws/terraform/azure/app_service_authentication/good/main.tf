resource "azurerm_app_service" "good" {
  # ...
  auth_settings {
    enabled = true
    # ...
  }

}