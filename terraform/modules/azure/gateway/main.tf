resource "azurerm_virtual_network_gateway" "gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.gateway_type
  sku                 = var.sku
  ip_configuration {
    name                 = var.gateway_ip_configuration_name
    subnet_id            = var.gateway_subnet_id
    public_ip_address_id = var.gateway_public_ip_address_id
  }
}

