# variables.tf

variable "environment_prefix" {
  description = "The prefix for the environment."
  type        = "string"
  default     = "d"          # this is different for each environment
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = "string"
  default     = "eastus"
}

variable "tags" {
  description = "The tags to associate with the resources."
  type        = "map"

  default = {
    "terraform" = "true"
  }
}

variable "tenant_id" {
  type        = "string"
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
  default     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "azuredevops_object_id" {
  default     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "adminuser_object_id" {
  default     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "app_service_plan_sku_tier" {
  type        = "string"
  description = "Specifies the plan's pricing tier."
  default     = "Shared"                             # Shared | Basic | Standard | ...
}

variable "app_service_plan_sku_size" {
  type        = "string"
  description = "Specifies the plan's instance size."
  default     = "D1"                                  # D1 | B1 | S1 | ...
}

variable "db_sku" {
  type        = "string"
  description = "Specifies the SKU Name for this PostgreSQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
  default     = "B_Gen5_1"
}

variable "db_capacity" {
  type        = "string"
  description = "The scale up/out capacity, representing server's compute units."
  default     = 1
}

variable "db_tier" {
  type        = "string"
  description = "The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized. "
  default     = "Basic"
}

variable "db_family" {
  type        = "string"
  description = "The family of hardware Gen4 or Gen5, before selecting your family check the product documentation for availability in your region."
  default     = "Gen5"
}

variable "db_storage_mb" {
  type        = "string"
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  default     = 51200
}

variable "db_backup_retention_days" {
  type        = "string"
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 7
}

variable "db_geo_redundant_backup" {
  type        = "string"
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
}

variable "db_administrator_login" {
  type        = "string"
  description = "The Administrator Login for the PostgreSQL Server. Changing this forces a new resource to be created."
  default     = "adminuser"
}

variable "db_administrator_login_password" {
  type        = "string"
  description = "The Administrator Login's password for the PostgreSQL Server. Required to be passed in."
}

variable "db_version" {
  type        = "string"
  description = "Specifies the version of PostgreSQL to use. Valid values are 9.5, 9.6, and 10.0. Changing this forces a new resource to be created."
  default     = "10.0"
}

variable "db_ssl_enforcement" {
  type        = "string"
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = "Enabled"
}

variable "key_vault_secret_1" {
  type        = "string"
  description = "The first secret"
}

variable "key_vault_secret_2" {
  type        = "string"
  description = "The second secret"
}