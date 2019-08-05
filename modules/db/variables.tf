# variables.tf

variable "environment_prefix" {}
variable "location" {}

variable "tags" {
  type = "map"
}

variable "resource_group_name" {}
variable "db_sku" {}
variable "db_capacity" {}
variable "db_tier" {}
variable "db_family" {}
variable "db_storage_mb" {}
variable "db_backup_retention_days" {}
variable "db_geo_redundant_backup" {}
variable "db_administrator_login" {}
variable "db_administrator_login_password" {}
variable "db_version" {}
variable "db_ssl_enforcement" {}