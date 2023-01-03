resource "azurerm_security_center_subscription_pricing" "bad" {
  tier          = "Free"
  resource_type = "AppServices"
}

resource "azurerm_security_center_subscription_pricing" "bad_1" {
  tier          = "Free"
  resource_type = var.free_service
}


resource "azurerm_security_center_subscription_pricing" "bad_2" {
  tier          = "Free"
  for_each      = toset(var.security_center_resource_types)
  resource_type = each.value
}
