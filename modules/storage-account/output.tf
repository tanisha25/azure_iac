output "adls_storage_account_name" {
  value = azurerm_storage_account.adls.name
}

output "adls_primary_access_key" {
  value     = azurerm_storage_account.adls.primary_access_key
  sensitive = true
}

output "adls_primary_connection_string" {
  value     = azurerm_storage_account.adls.primary_connection_string
  sensitive = true
}
