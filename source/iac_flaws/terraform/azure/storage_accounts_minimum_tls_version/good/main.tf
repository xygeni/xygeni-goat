resource "azurerm_storage_account" "good" {
  name                     = "example"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # min_tls_version          = "TLS1_2" # This is the default, safe
  network_rules {
    default_action             = "Allow"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
}

resource "azurerm_storage_account" "good_2" {
  name                     = "example"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Allow"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
}

resource "azurerm_storage_account" "good_3" {
  name                     = "example"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  min_tls_version          = "TLS1_3" # Not yet available...
  network_rules {
    default_action             = "Allow"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
}
