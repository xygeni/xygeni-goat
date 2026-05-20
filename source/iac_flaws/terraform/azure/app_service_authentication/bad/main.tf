resource "azurerm_app_service" "bad" {
  # ...
  auth_settings {
    enabled = false
    # ...
  }

}

resource "azurerm_app_service" "bad_2" {
}