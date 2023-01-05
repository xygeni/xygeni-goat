resource "azurerm_kubernetes_cluster" "bad" {
  role_based_access_control_enabled = false # FLAW
}