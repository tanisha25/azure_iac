resource "azurerm_storage_account" "adls" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true  # This enables ADLS Gen2

  tags = var.tags
  # Network rules
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]    
    ip_rules = [
         "100.0.0.1"
    ]
  }
}
