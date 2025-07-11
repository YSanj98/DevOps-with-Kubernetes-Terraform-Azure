variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "os_type" {
  description = "The Operating System type for the App Service Plan (Linux or Windows)."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan (e.g., P1v2, B1, S1)."
  type        = string
}
