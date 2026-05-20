resource "azurerm_web_application_firewall_policy" "good" {
  # no policy_settings, defaults are ok
}

resource "azurerm_web_application_firewall_policy" "good_2" {
  # explicit values
  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }
}

resource "azurerm_web_application_firewall_policy" "good_3" {
  # defaults are ok
  policy_settings {
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }
}