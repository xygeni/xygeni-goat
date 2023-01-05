resource "azurerm_linux_virtual_machine_scale_set" "pass" {
  name                = var.scaleset_name
  # ...
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.new.public_key_pem
  }
}