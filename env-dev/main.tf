# main.tf

terraform {
  backend "azurerm" {
    container_name = "terraform"
    key            = "tfbackend"
  }
}

# Configure the Azure Provider

provider "azurerm" {
# The `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.20.0"
}

module "rg" {
  source = "../modules/rg"

  environment_prefix = "${var.environment_prefix}"
  location           = "${var.location}"
  tags               = "${var.tags}"
}

module "db" {
  source = "../modules/db"

  environment_prefix              = "${var.environment_prefix}"
  location                        = "${module.rg.location}"
  tags                            = "${var.tags}"
  resource_group_name             = "${module.rg.name}"
  db_sku                          = "${var.db_sku}"
  db_capacity                     = "${var.db_capacity}"
  db_tier                         = "${var.db_tier}"
  db_family                       = "${var.db_family}"
  db_storage_mb                   = "${var.db_storage_mb}"
  db_backup_retention_days        = "${var.db_backup_retention_days}"
  db_geo_redundant_backup         = "${var.db_geo_redundant_backup}"
  db_administrator_login          = "${var.db_administrator_login}"
  db_administrator_login_password = "${var.db_administrator_login_password}"
  db_version                      = "${var.db_version}"
  db_ssl_enforcement              = "${var.db_ssl_enforcement}"
}

module "api" {
  source = "../modules/api"

  environment_prefix        = "${var.environment_prefix}"
  resource_group_name       = "${module.rg.name}"
  location                  = "${module.rg.location}"
  tags                      = "${var.tags}"
  app_service_plan_sku_tier = "${var.app_service_plan_sku_tier}"
  app_service_plan_sku_size = "${var.app_service_plan_sku_size}"
}

module "kv" {
  source = "../modules/kv"

  environment_prefix               = "${var.environment_prefix}"
  location                         = "${var.location}"
  tags                             = "${var.tags}"
  resource_group_name              = "${module.rg.name}"
  tenant_id                        = "${var.tenant_id}"
  azuredevops_object_id            = "${var.azuredevops_object_id}"
  key_vault_secret_1               = "${var.key_vault_secret_1}"
  key_vault_secret_2               = "${var.key_vault_secret_2}"
}

module "storage" {
  source = "../modules/storage"

  environment_prefix  = "${var.environment_prefix}"
  location            = "${var.location}"
  tags                = "${var.tags}"
  resource_group_name = "${module.rg.name}"
}
