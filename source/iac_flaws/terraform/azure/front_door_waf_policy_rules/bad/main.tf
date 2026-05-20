# fail

resource "azurerm_frontdoor_firewall_policy" "default" {
  name                = "example"
  resource_group_name = "example"
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_disabled" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Block"
        enabled = false
        rule_id = "944240"
      }
    }
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_disabled_default" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Block"
        rule_id = "944240"
      }
    }
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_1_enabled_allow" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.1"

    override {
      rule_group_name = "JAVA"

      rule {
        action  = "Allow"
        enabled = true
        rule_id = "944240"
      }
    }
  }
}

resource "azurerm_frontdoor_firewall_policy" "dsr_1_0" {
  name                = "example"
  resource_group_name = "example"

  managed_rule {
    type    = "Microsoft_DefaultRuleSet"
    version = "1.0"
  }
}
