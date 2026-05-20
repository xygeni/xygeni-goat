resource "azurerm_security_center_subscription_pricing" "bad" {
  tier          = "Free"
  resource_type = "VirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "bad_1" {
  tier          = "Free"
  resource_type = var.free_service_2
}


resource "azurerm_security_center_subscription_pricing" "bad_2" {
  tier          = "Free"
  for_each      = toset(var.security_center_resource_types)
  resource_type = each.value
}

resource "azurerm_security_center_subscription_pricing" "bad_3" {
  tier          = "Free"
  # This is the default: resource_type = "VirtualMachines"
}