resource "azurerm_role_definition" "bad" {
  name        = "too-permissive-role"
  scope       = data.azurerm_subscription.primary.id

  permissions {
    actions = [ "*" ]
    not_actions = []
  }

  assignable_scopes = [
    "/"
  ]
}

resource "azurerm_role_definition" "bad_2" {
  name        = "too-permissive-role-2"
  scope       = data.azurerm_subscription.primary.id

  permissions {
    actions = ["*"]
    not_actions = []
  }

  assignable_scopes = [
    "/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333"
  ]
}

resource "azurerm_role_definition" "bad_3" {
  name        = "too-permissive-role-2"
  scope       = data.azurerm_subscription.primary.id

  permissions {
    actions = ["*"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]
}