variable "server_name" {
  description = "The name of the SQL server."
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
variable "mssql_version" {
  description = "The version for the MSSQL server."
  type        = string
  default     = "12.0"
}
variable "db_username" {
  description = "The administrator username for the SQL server."
  type        = string
}
variable "db_password" {
  description = "The administrator password for the SQL server."
  type        = string
  sensitive   = true
}
variable "db_name" {
  description = "The name of the MSSQL database."
  type        = string
}
variable "db_collation" {
  description = "The collation for the MSSQL database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}
variable "db_sku_name" {
  description = "The SKU name for the MSSQL database."
  type        = string
}
variable "db_max_size_gb" {
  description = "The max size in GB for the MSSQL database."
  type        = number
  default     = 2
}
variable "db_zone_redundant" {
  description = "Whether the MSSQL database is zone redundant."
  type        = bool
  default     = false
}


