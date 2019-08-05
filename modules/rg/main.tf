# main.tf

resource "azurerm_resource_group" "default" {
  name     = "${var.environment_prefix}-app-rg"
  location = "${var.location}"
  tags     = "${var.tags}"
}