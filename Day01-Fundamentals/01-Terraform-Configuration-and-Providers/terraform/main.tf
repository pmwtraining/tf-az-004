data "azurerm_client_config" "current" {}

output "subscription_id" {
  description = "Active Azure subscription ID"
  value       = data.azurerm_client_config.current.subscription_id
}

output "tenant_id" {
  description = "Authenticated Azure tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
}

output "client_id" {
  description = "Authenticated client ID"
  value       = data.azurerm_client_config.current.client_id
}
