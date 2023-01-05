resource "azurerm_kubernetes_cluster" "ok" {
  role_based_access_control_enabled = true // FIXED
}

resource "azurerm_kubernetes_cluster" "ok_default" {
  # role_based_access_control_enabled = true is the default
}