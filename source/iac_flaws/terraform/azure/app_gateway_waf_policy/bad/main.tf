resource "azurerm_web_application_firewall_policy" "bad" {
  # ...
  policy_settings {
    enabled                     = false
    request_body_check          = false
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }
  # ...
}