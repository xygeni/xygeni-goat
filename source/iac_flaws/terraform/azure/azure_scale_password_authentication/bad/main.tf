resource "azurerm_linux_virtual_machine_scale_set" "fail" {
  name                = var.scaleset_name
  # ...
  disable_password_authentication = false
}
