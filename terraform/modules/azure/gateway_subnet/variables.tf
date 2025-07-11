variable "name" {
  description = "The name of the gateway subnet. Should be 'GatewaySubnet'."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes for the gateway subnet."
  type        = list(string)
}


