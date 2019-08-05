# main.tf

terraform {
  backend "azurerm" {
    container_name = "terraform"
    key            = "tfbackend-web.tfstate"
  }
}

provider "azurerm" {
  version = "=1.20.0"
}

module "rg" {
  source = "../modules/rg"

  environment_prefix = "${var.environment_prefix}"
  location           = "${var.location}"
  tags               = "${var.tags}"
}

module "web" {
  source = "../modules/web"

  environment_prefix        = "${var.environment_prefix}"
  resource_group_name       = "${module.rg.name}"
  location                  = "${module.rg.location}"
  tags                      = "${var.tags}"
  app_service_plan_sku_tier = "${var.app_service_plan_sku_tier}"
  app_service_plan_sku_size = "${var.app_service_plan_sku_size}"
}