variable "disk_name" {
  default = "mydisk"
}

variable "location" {
  default = "West US 2"
}

variable "resource_group_name" {
  default = ""
}
variable "storage_account_type" {
  default = ""
}
variable "disk_size_gb" {
  default = ""
}

variable "common_tags" {
  default = ""
}

resource "azurerm_resource_group" "example" {
  name     = "my_group"
  location = var.location
}

resource "azurerm_managed_disk" "pass3" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.common_tags
}

resource "azurerm_managed_disk" "pass2" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb

  # Fixed - encryption enabled
  encryption_settings {
    enabled = true

    disk_encryption_key {
      secret_url      = azurerm_key_vault_secret.disk_enc_secret.id
      source_vault_id = azurerm_key_vault.vault.id
    }
    key_encryption_key {
      key_url         = azurerm_key_vault_key.disk_enc_key.id
      source_vault_id = azurerm_key_vault.vault.id
    }
  }

  tags = var.common_tags
}

resource "azurerm_managed_disk" "pass" {
  name                   = var.disk_name
  location               = var.location
  resource_group_name    = azurerm_resource_group.example.name
  storage_account_type   = "Standard_LRS"
  create_option          = "Empty"
  disk_size_gb           = "1"
  # Alternative to encryption_settings
  disk_encryption_set_id = azurerm_disk_encryption_set.example.id

  tags = {
    environment = "staging"
  }
}



