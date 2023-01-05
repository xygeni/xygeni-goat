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
  name = "my_group"
  location = var.location
}

resource "azurerm_managed_disk" "fail" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = false
  }
  tags = var.common_tags
}

resource "azurerm_managed_disk" "fail2" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  encryption_settings = {
    enabled = false
  }

  tags = {
    environment = "staging"
  }
}



