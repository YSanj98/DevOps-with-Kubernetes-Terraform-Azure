variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "db_fqdn" {
  description = "The FQDN of the MySQL Flexible Server."
  type        = string
}

variable "db_name" {
  description = "The name of the database."
  type        = string
  default     = "wordpress_db"
}
