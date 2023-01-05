resource "azurerm_data_factory" "pass" {
  name                = "example"
  location            = "azurerm_resource_group.example.location"
  resource_group_name = "azurerm_resource_group.example.name"
  public_network_enabled = false
}