resource "azurerm_app_service" "fail" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  https_only          = true
  site_config {
    ftps_state = "AllAllowed"
  }

}

resource "azurerm_app_service" "fail2" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_linux_web_app" "fail" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  logs {
    failed_request_tracing_enabled = false
    detailed_error_messages = false
  }
  client_certificate_enabled = true
  auth_settings {
    enabled = true
  }
  site_config {
    ftps_state = "AllAllowed"
    cors {
      allowed_origins = ["*"]
    }
  }
}

resource "azurerm_windows_web_app" "fail" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  logs {
    failed_request_tracing_enabled = false
    detailed_error_messages = false
  }
  site_config {
    ftps_state = "AllAllowed"
    cors {
      allowed_origins = ["*"]
    }
  }
}