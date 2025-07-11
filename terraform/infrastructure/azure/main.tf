
# Resource Group
module "resource_group" {
  source   = "../../modules/azure/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.resource_group_tags
}

# SQL Database
module "sql_db" {
  source              = "../../modules/azure/sql_db"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.server_name
  db_username         = var.db_username
  db_password         = var.db_password
  db_name             = var.db_name
  db_collation        = var.db_collation
  db_sku_name         = var.db_sku_name
  db_max_size_gb      = var.db_max_size_gb
  db_zone_redundant   = var.db_zone_redundant
  mssql_version       = var.mssql_version

  depends_on = [module.resource_group]
}

# Network Security Group
module "security_group" {
  source              = "../../modules/azure/security_group"
  name                = var.security_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rules      = var.security_rules

  depends_on = [module.resource_group]
}

# VNet module
module "virtual_network" {
  source              = "../../modules/azure/vnet"
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  depends_on = [module.resource_group]
}


# Gateway Subnet (replaces Application Subnet)
module "gateway_subnet" {
  source               = "../../modules/azure/gateway_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  name                 = var.subnet_name
  address_prefixes     = var.gateway_subnet_address_prefixes
  depends_on           = [module.resource_group, module.virtual_network]
}

# App Service Plan
module "app_service_plan" {
  source                = "../../modules/azure/app_service_plan"
  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  os_type               = var.os_type
  sku_name              = var.sku_name

  depends_on = [module.resource_group]
}

# App Service
module "app_service" {
  source              = "../../modules/azure/app_service"
  resource_group_name = var.resource_group_name
  location            = var.location
  app_service_name    = var.app_service_name
  app_service_plan_id = module.app_service_plan.id
  db_username         = var.db_username
  db_password         = var.db_password
  db_fqdn             = module.sql_db.server_fqdn
  db_name             = module.sql_db.database_name

  depends_on = [module.resource_group, module.sql_db, module.app_service_plan]
}

# Gateway Public IP module
module "gateway_public_ip" {
  source              = "../../modules/azure/gateway_public_ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.gateway_public_ip_name
  allocation_method   = var.gateway_public_ip_allocation_method
  sku                 = var.gateway_public_ip_sku
  tags                = var.gateway_tags
  depends_on          = [module.resource_group]
}

# Gateway module
module "gateway" {
  source                        = "../../modules/azure/gateway"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.gateway_name
  gateway_type                  = var.gateway_type
  sku                           = var.gateway_sku
  gateway_ip_configuration_name = var.gateway_ip_configuration_name
  gateway_subnet_id             = module.gateway_subnet.subnet_id
  gateway_public_ip_address_id  = module.gateway_public_ip.id

  depends_on = [module.resource_group, module.gateway_subnet, module.gateway_public_ip]
}

# AKS module
module "aks" {
  source              = "../../modules/azure/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_name            = var.aks_name
  dns_prefix          = var.dns_prefix
  agent_count         = var.agent_count
  agent_vm_size       = var.agent_vm_size
  depends_on          = [module.resource_group]
}

# Application Insights module
module "application_insights" {
  source              = "../../modules/azure/application_insights"
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.application_insights_name
  application_type    = var.application_insights_type
  retention_in_days   = var.application_insights_retention
  tags                = var.application_insights_tags
  depends_on          = [module.resource_group]
}

