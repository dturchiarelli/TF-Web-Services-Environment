# main.tf

resource "azurerm_postgresql_server" "default" {
  name                = "${var.environment_prefix}-app-db"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.tags}"

  sku {
    name     = "${var.db_sku}"
    capacity = "${var.db_capacity}"
    tier     = "${var.db_tier}"
    family   = "${var.db_family}"
  }

  storage_profile {
    storage_mb            = "${var.db_storage_mb}"
    backup_retention_days = "${var.db_backup_retention_days}"
    geo_redundant_backup  = "${var.db_geo_redundant_backup}"
  }

  administrator_login          = "${var.db_administrator_login}"
  administrator_login_password = "${var.db_administrator_login_password}"
  version                      = "${var.db_version}"
  ssl_enforcement              = "${var.db_ssl_enforcement}"
}

resource "azurerm_postgresql_firewall_rule" "azure" {
  name                = "azure"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.default.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_firewall_rule" "userhome" {
  name                = "user-home"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.default.name}"
  start_ip_address    = "xx.xx.xxx.xxx"
  end_ip_address      = "xx.xx.xxx.xxx"
}

resource "azurerm_postgresql_database" "app" {
  name                = "app"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.default.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}