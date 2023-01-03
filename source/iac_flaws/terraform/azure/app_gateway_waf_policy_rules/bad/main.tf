resource "azurerm_web_application_firewall_policy" "bad" {
  name                = "example-wafpolicy"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.0"
    }
  }
}

resource "azurerm_web_application_firewall_policy" "bad_2" {
  name                = "example-wafpolicy2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
        disabled_rules  = ["920300", "920440"]
      }
      rule_group_override {
        rule_group_name = "REQUEST-944-APPLICATION-ATTACK-JAVA"
        disabled_rules  = ["944240"] # Log4Shell will pass
      }
    }
  }
}