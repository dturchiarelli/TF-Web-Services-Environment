# variables.tf

variable "environment_prefix" {
  description = "The prefix for the environment."
  type        = "string"
  default     = "d"
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