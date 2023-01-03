resource "azurerm_data_lake_store" "fail" {
  name                = "my_data_lake"
  location            = var.location
  resource_group_name = var.resource_group_name

  encryption_state = "Disabled"
  encryption_type  = ""
}
