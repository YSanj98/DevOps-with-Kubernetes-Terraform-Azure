output "resource_group_id" {
  value = module.resource_group.id
}

output "security_group_id" {
  value = module.security_group.id
}

output "app_service_plan_id" {
  value = module.app_service_plan.id
}

output "app_service_id" {
  value = module.app_service.id
}

output "sql_server_id" {
  value = module.sql_db.server_id
}

output "sql_server_fqdn" {
  value = module.sql_db.server_fqdn
}

output "sql_database_id" {
  value = module.sql_db.database_id
}

output "sql_database_name" {
  value = module.sql_db.database_name
}

output "gateway_id" {
  value = module.gateway.id
}
