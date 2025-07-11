output "application_insights_id" {
  description = "The ID of the Application Insights instance."
  value       = azurerm_application_insights.this.id
}

output "application_insights_instrumentation_key" {
  description = "The Instrumentation Key of the Application Insights instance."
  value       = azurerm_application_insights.this.instrumentation_key
}

output "application_insights_connection_string" {
  description = "The Connection String of the Application Insights instance."
  value       = azurerm_application_insights.this.connection_string
}
