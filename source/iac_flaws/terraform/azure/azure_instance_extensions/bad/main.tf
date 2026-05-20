# fail

resource "azurerm_linux_virtual_machine" "default" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_linux_virtual_machine" "enabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "linux-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = true
}

resource "azurerm_windows_virtual_machine" "default" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "win-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_windows_virtual_machine" "enabled" {
  admin_password      = "admin"
  admin_username      = "admin123"
  location            = "azurerm_resource_group.test.location"
  name                = "win-vm"
  resource_group_name = "azurerm_resource_group.test.name"
  size                = "Standard_F2"

  network_interface_ids = [
    "azurerm_network_interface.test.id"
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  allow_extension_operations = true
}

resource "azurerm_virtual_machine" "fail" {
  name                  = "acctvm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_F2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "myosdisk1"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_extension" "example" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_virtual_machine.fail.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  tags = {
    environment = "Production"
  }
}