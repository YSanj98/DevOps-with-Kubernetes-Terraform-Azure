variable "name" {
  description = "The name of the virtual network gateway."
  type        = string
}

variable "location" {
  description = "The location of the virtual network gateway."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "gateway_type" {
  description = "The type of the virtual network gateway (e.g., 'Vpn', 'ExpressRoute')."
  type        = string
}

variable "sku" {
  description = "The SKU of the virtual network gateway (e.g., 'Basic', 'VpnGw1')."
  type        = string
}

variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration."
  type        = string
}

variable "gateway_subnet_id" {
  description = "The ID of the subnet where the gateway will be deployed."
  type        = string
}

variable "gateway_public_ip_address_id" {
  description = "The ID of the public IP address associated with the gateway."
  type        = string
}
