resource "azurerm_security_center_contact" "bad" {
  name  = "contact"
  email = "contact@example.com"
  phone = "+1-555-555-5555"

  alert_notifications = false # FLAW <1>
  alerts_to_admins    = true
}