output "kube_config" {
  description = "Kube config for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "The AKS API server address."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "client_certificate" {
  description = "The client certificate for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "The client key for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The cluster CA certificate for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  sensitive   = true
}
