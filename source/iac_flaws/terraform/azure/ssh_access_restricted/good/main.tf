# pass

resource "azurerm_network_security_rule" "https" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = 443
  source_address_prefix  = "Internet"
}

resource "azurerm_network_security_rule" "ssh_restricted_prefixes" {
  name                        = "example"
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = "azurerm_network_security_group.example.name"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "azurerm_resource_group.example.name"

  destination_port_range = 22
  source_address_prefixes = [
    "123.123.123.123/32",
    "10.0.0.0/16"
  ]
}

resource "azurerm_network_security_group" "ssh_restricted" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"

  security_rule {
    name      = "example"
    access    = "Allow"
    direction = "Inbound"
    priority  = 100
    protocol  = "Tcp"

    destination_port_range = 22
    source_address_prefix  = "10.0.0.0/16"
  }
}
