resource "azurerm_frontdoor_firewall_policy" "good" {
  name                = "example-wafpolicy"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  enabled                     = true # FIXED
  mode                        = "Prevention"
  request_body_check          = true
  file_upload_limit_in_mb     = 100
  max_request_body_size_in_kb = 128

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }
  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }
}