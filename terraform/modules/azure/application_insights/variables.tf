variable "name" {
  description = "The name of the Application Insights instance."
  type        = string
}

variable "location" {
  description = "The Azure location where the resource will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "application_type" {
  description = "The type of Application Insights to create."
  type        = string
  default     = "web"
}

variable "retention_in_days" {
  description = "The retention period in days."
  type        = number
  default     = 90
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    environment = "development"
    project     = "wordpress-insights"
  }
}
