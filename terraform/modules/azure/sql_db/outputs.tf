output "server_id" {
  value = azurerm_mssql_server.db.id
}

output "server_fqdn" {
  value = azurerm_mssql_server.db.fully_qualified_domain_name
}

output "database_id" {
  value = azurerm_mssql_database.db.id
}

output "database_name" {
  value = azurerm_mssql_database.db.name
}
