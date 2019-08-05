# variables.tf

variable "environment_prefix" {}
variable "location" {}

variable "tags" {
  type = "map"
}

variable "resource_group_name" {}

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

variable "key_vault_secret_1" {}
variable "key_vault_secret_2" {}