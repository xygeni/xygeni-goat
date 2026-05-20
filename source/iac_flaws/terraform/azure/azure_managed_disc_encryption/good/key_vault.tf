data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
  name                        = "des-example-keyvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_access_policy" "example-user"  {
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id = "${data.azurerm_client_config.current.tenant_id}"
  object_id = "${data.azurerm_client_config.current.object_id}"

  key_permissions = [
    "create",
    "delete",
    "get",
  ]

  secret_permissions = [
    "delete",
    "get",
    "set",
  ]
}

resource "azurerm_key_vault_key" "disk_enc_key" {
  name         = "des-example-key"
  key_vault_id = azurerm_key_vault.vault.id
  key_type     = "RSA"
  key_size     = 2048

  depends_on = [
    azurerm_key_vault_access_policy.example-user
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_key_vault_secret" "disk_enc_secret" {
  name      = "disk_enc_secret"
  value     = "szechuan"
  key_vault_id = azurerm_key_vault.vault.id
}

resource "azurerm_disk_encryption_set" "example" {
  name                = "des"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  key_vault_key_id    = azurerm_key_vault_key.disk_enc_key.id

  identity {
    type = "SystemAssigned"
  }
}