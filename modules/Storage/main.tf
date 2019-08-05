# main.tf

resource "azurerm_storage_account" "default" {
  name                     = "${var.environment_prefix}appstorage"
  location                 = "${var.location}"
  resource_group_name      = "${var.resource_group_name}"
  tags                     = "${var.tags}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}