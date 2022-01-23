resource "azurerm_storage_account" "storage_account" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = "StorageV2"
  enable_https_traffic_only = true
  is_hns_enabled            = var.is_hns_enabled
  tags                      = var.tags

  network_rules {
    default_action             = var.network_rule_default_action
    ip_rules                   = var.network_rule_ip_rules
    virtual_network_subnet_ids = var.network_rule_virtual_network_subnet_ids
    bypass                     = var.network_rule_bypass
  }
}

output "id" {
  value     = azurerm_storage_account.storage_account.id
  sensitive = false
}

output "primary_access_key" {
  value     = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}

output "secondary_access_key" {
  value     = azurerm_storage_account.storage_account.secondary_access_key
  sensitive = true
}

output "primary_connection_string" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}

output "secondary_connection_string" {
  value     = azurerm_storage_account.storage_account.secondary_connection_string
  sensitive = true
}

output "storage_account_name" {
  value     = azurerm_storage_account.storage_account.name
  sensitive = false
}

output "primary_blob_endpoint" {
  value     = azurerm_storage_account.storage_account.primary_blob_endpoint
  sensitive = false
}

output "secondary_blob_endpoint" {
  value     = azurerm_storage_account.storage_account.secondary_blob_endpoint
  sensitive = false
}