# main.tf

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "default" {
  name                            = "${var.environment_prefix}-app-kv"
  location                        = "${var.location}"
  resource_group_name             = "${var.resource_group_name}"
  tags                            = "${var.tags}"
  enabled_for_template_deployment = true
  tenant_id                       = "${var.tenant_id}"

  sku {
    name = "standard"
  }
}

resource "azurerm_key_vault_access_policy" "azuredevops" {
  vault_name          = "${azurerm_key_vault.default.name}"
  resource_group_name = "${var.resource_group_name}"
  tenant_id           = "${var.tenant_id}"
  object_id           = "${var.azuredevops_object_id}"

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
  ]
}

resource "azurerm_key_vault_access_policy" "current" {
  vault_name          = "${azurerm_key_vault.default.name}"
  resource_group_name = "${var.resource_group_name}"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  object_id           = "${data.azurerm_client_config.current.service_principal_object_id}"

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
  ]
}

resource "azurerm_key_vault_access_policy" "adminuser" {
  vault_name          = "${azurerm_key_vault.default.name}"
  resource_group_name = "${var.resource_group_name}"
  tenant_id           = "${var.tenant_id}"
  object_id           = "${var.adminuser_object_id}"

  secret_permissions = [
    "get",
    "list",
    "set",
    "delete",
    "recover",
    "backup",
    "restore",
  ]

  certificate_permissions = [
    "create",
    "delete",
    "deleteissuers",
    "get",
    "getissuers",
    "import",
    "list",
    "listissuers",
    "managecontacts",
    "manageissuers",
    "purge",
    "recover",
    "setissuers",
    "update",
    "backup",
    "restore",
  ]

  key_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "recover",
    "backup",
    "restore",
  ]
}

resource "azurerm_key_vault_secret" "secret_1" {
  name      = "secret_1"
  value     = "${var.key_vault_secret_1}"
  vault_uri = "${azurerm_key_vault.default.vault_uri}"
  tags      = "${var.tags}"
}

resource "azurerm_key_vault_secret" "secret_2" {
  name      = "secret_2"
  value     = "${var.key_vault_secret_2}"
  vault_uri = "${azurerm_key_vault.default.vault_uri}"
  tags      = "${var.tags}"
}