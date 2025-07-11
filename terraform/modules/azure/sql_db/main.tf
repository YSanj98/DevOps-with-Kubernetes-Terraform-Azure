resource "azurerm_mssql_server" "db" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = var.mssql_version
  administrator_login          = var.db_username
  administrator_login_password = var.db_password
}

resource "azurerm_mssql_database" "db" {
  name           = var.db_name
  server_id      = azurerm_mssql_server.db.id
  collation      = var.db_collation
  sku_name       = var.db_sku_name
  max_size_gb    = var.db_max_size_gb
  zone_redundant = var.db_zone_redundant
}
