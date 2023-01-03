resource "azurerm_security_center_subscription_pricing" "good" {
  tier          = "Standard"
  resource_type = "AppServices"
}

resource "azurerm_security_center_subscription_pricing" "good_2" {
  tier          = "Standard"
  for_each      = toset(var.security_center_resource_types)
  resource_type = each.value
}

resource "azurerm_security_center_subscription_pricing" "good_3" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "good_4" {
  tier          = "Free"
  # This is the default: resource_type = "VirtualMachines"
}
