variable "name" {
  description = "The name of the public IP address."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP (Static or Dynamic)."
  type        = string
  default     = "Dynamic"
}

variable "sku" {
  description = "The SKU of the public IP (Basic or Standard)."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default = {
    "environment" = "development"
  }
}
