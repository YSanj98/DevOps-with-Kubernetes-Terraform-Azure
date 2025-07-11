# ==================== Define variables for Azure resources =====================
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "wordpress-rg"
}
variable "location" {
  description = "The Azure region to deploy resources in."
  type        = string
  default     = "eastus"
}
variable "resource_group_tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default = {
    environment = "wordpress-dev"
  }
}


# ==================== SQL Database====================
variable "server_name" {
  description = "The name of the SQL Server."
  type        = string
  default     = "free-tier-sqlserver"
}
variable "db_username" {
  description = "The username for the database."
  type        = string
  default     = "dbuser"
}
variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}
variable "db_name" {
  description = "The name of the SQL Database."
  type        = string
  default     = "freetierdb"
}
variable "db_collation" {
  description = "The collation for the MSSQL database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}
variable "db_sku_name" {
  description = "The SKU name for the MSSQL database."
  type        = string
  default     = "Basic"
}
variable "db_max_size_gb" {
  description = "The max size in GB for the MSSQL database."
  type        = number
  default     = 32
}
variable "db_zone_redundant" {
  description = "Whether the MSSQL database is zone redundant."
  type        = bool
  default     = false
}
variable "mssql_version" {
  description = "The version for the MSSQL server."
  type        = string
  default     = "12.0"
}


# ==================== Network Security Group ======================
variable "security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
  default     = "wordpress-nsg"
}
variable "security_rules" {
  description = "A list of security rules to apply to the Network Security Group."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "AllowHTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTPS"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowSSH"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}


# =========================== Virtual Network variables =========================
variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "wordpress-vnet"
}
variable "address_space" {
  description = "The address spaces for the virtual networks."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


# ============================ Gateway Subnet variables ============================
variable "subnet_name" {
  description = "The name of the gateway subnet."
  type        = string
}
variable "gateway_subnet_address_prefixes" {
  description = "The address spaces for the gateway subnet."
  type        = list(string)
}


# ========================== App Service Plan ==========================
variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default     = "wordpress-plan"
}
variable "os_type" {
  description = "The Operating System type for the App Service Plan (Linux or Windows)."
  type        = string
  default     = "Linux"
}
variable "sku_name" {
  description = "The SKU name for the App Service Plan."
  type        = string
  default     = "B1"
}


# ====================== App Service =========================
variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
  default     = "wordpress-app"
}


# ======================= Gateway Public IP =========================
variable "gateway_public_ip_name" {
  description = "The name of the public IP address for the gateway."
  type        = string
  default     = "gateway-public-ip"
}
variable "gateway_public_ip_allocation_method" {
  description = "The allocation method for the gateway public IP (Static or Dynamic)."
  type        = string
  default     = "Dynamic"
}
variable "gateway_public_ip_sku" {
  description = "The SKU for the gateway public IP (Basic or Standard)."
  type        = string
  default     = "Basic"
}
variable "gateway_tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    "environment" = "development"
  }
}


# ========================== Gateway variables ==========================
variable "gateway_name" {
  description = "The name of the virtual network gateway."
  type        = string
  default     = "wordpress-gateway"
}
variable "gateway_type" {
  description = "The type of the virtual network gateway."
  type        = string
  default     = "Vpn"
}
variable "gateway_sku" {
  description = "The SKU of the virtual network gateway."
  type        = string
  default     = "Basic"
}
variable "gateway_ip_configuration_name" {
  description = "The name of the gateway IP configuration."
  type        = string
  default     = "gw-ip-config"
}
variable "gateway_subnet_id" {
  description = "The ID of the subnet where the gateway will be deployed."
  type        = string
}

variable "gateway_public_ip_address_id" {
  description = "The ID of the public IP address associated with the gateway."
  type        = string
  default     = ""
}


# ================== AKS variables ==================
variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "wordpress-aks"
}
variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
  default     = "wordpress-dns"
}
variable "agent_count" {
  description = "The number of agent nodes for the AKS cluster."
  type        = number
  default     = 1
}
variable "agent_vm_size" {
  description = "The size of the Virtual Machine to use for the agent pool nodes."
  type        = string
  default     = "Standard_DS2_v2"
}


# ======================== Application Insights variables ========================
variable "application_insights_name" {
  description = "The name of the Application Insights instance."
  type        = string
  default     = "wordpress-appinsights"
}

variable "application_insights_type" {
  description = "The type of Application Insights to create."
  type        = string
  default     = "web"
}

variable "application_insights_retention" {
  description = "The retention period in days for Application Insights."
  type        = number
  default     = 90
}

variable "application_insights_tags" {
  description = "A map of tags to assign to Application Insights."
  type        = map(string)
  default = {
    environment = "development"
  }
}
