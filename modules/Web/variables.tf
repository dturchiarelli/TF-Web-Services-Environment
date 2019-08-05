# variables.tf

variable "environment_prefix" {}
variable "location" {}

variable "tags" {
  type = "map"
}

variable "resource_group_name" {}
variable "app_service_plan_sku_tier" {}
variable "app_service_plan_sku_size" {}