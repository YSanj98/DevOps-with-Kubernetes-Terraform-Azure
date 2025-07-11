resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.agent_count
    vm_size    = var.agent_vm_size
  }

  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }

  tags = var.tags
}
