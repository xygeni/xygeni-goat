resource "azurerm_web_application_firewall_policy" "good" {
  name                = "example-wafpolicy"
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
    }
  }
}

resource "azurerm_web_application_firewall_policy" "good_2" {
  name                = "example-wafpolicy"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  managed_rules {
    managed_rule_set {
      type    = "Microsoft_BotManagerRuleSet" # not restricted by configuratoin
      version = "1.0"
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "West Europe"
}

resource "azurerm_web_application_firewall_policy" "good" {
  name                = "example-wafpolicy"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.1"
      rule_group_override {
        rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
        disabled_rules  = [
          "920300",
          "920440"
        ]
      }
    }
  }
}