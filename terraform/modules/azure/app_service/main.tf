
resource "azurerm_linux_web_app" "name" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on = true
  }

  app_settings = {
    "WORDPRESS_DB_HOST"     = var.db_fqdn
    "WORDPRESS_DB_USER"     = "${var.db_username}@${var.db_name}"
    "WORDPRESS_DB_PASSWORD" = var.db_password
    "WORDPRESS_DB_NAME"     = var.db_name
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
