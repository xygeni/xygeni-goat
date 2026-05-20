resource "azurerm_role_definition" "ok" {
  name        = "restrictive-role-2"
  scope       = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.Storage/*/read",
      "Microsoft.Network/*/read",
      "Microsoft.Compute/*/read",
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/restart/action",
      "Microsoft.Authorization/*/read",
      "Microsoft.ResourceHealth/availabilityStatuses/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Insights/alertRules/*",
      "Microsoft.Insights/diagnosticSettings/*",
      "Microsoft.Support/*"
    ]
    not_actions = []
  }

  assignable_scopes = [
    "/"
  ]
}

resource "azurerm_role_definition" "ok_2" {
  name        = "restrictive-role-2"
  scope       = data.azurerm_subscription.primary.id
  description = "Manage everything except access to resources."

  permissions {
    actions = [
      "*"
    ]
    not_actions = [
      "Microsoft.Authorization/*/Delete",
      "Microsoft.Authorization/*/Write",
      "Microsoft.Authorization/elevateAccess/Action",
      "Microsoft.Blueprint/blueprintAssignments/write",
      "Microsoft.Blueprint/blueprintAssignments/delete"
    ]
    dataActions = []
    notDataActions = []
  }

  assignable_scopes = [
    "/"
  ]
}