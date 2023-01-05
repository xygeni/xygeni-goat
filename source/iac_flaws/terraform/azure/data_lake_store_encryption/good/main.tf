resource "azurerm_data_lake_store" "pass" {
  name                = "my_data_lake"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_lake_store" "pass2" {
  name                = "my_data_lake"
  location            = var.location
  resource_group_name = var.resource_group_name

  encryption_state = "Enabled"
  encryption_type  = "ServiceManaged"
}