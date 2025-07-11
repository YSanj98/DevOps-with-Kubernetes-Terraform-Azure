variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
}

variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "agent_count" {
  description = "The number of agent nodes for the cluster."
  type        = number
  default     = 2
}

variable "agent_vm_size" {
  description = "The size of the Virtual Machine to use for the agent pool nodes."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "default"
}

variable "identity_type" {
  description = "The type of identity to use for the AKS cluster."
  type        = string
  default     = "SystemAssigned"
}

variable "network_plugin" {
  description = "The network plugin to use for the AKS cluster."
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "The SKU of the load balancer to use for the AKS cluster."
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "Tags to apply to the AKS cluster resources."
  type        = map(string)
  default = {
    environment = "dev"
  }
}
