resource "azurerm_key_vault" "key_vault" {
  name                            = var.key_vault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  sku_name                        = var.sku_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = var.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  tags                            = var.tags

  network_acls {
    default_action = var.network_acls_default_action
    bypass         = var.network_acls_bypass
  }
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault_access_policy" "key_vault_access_policy_iac_sp" {
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = var.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"]
  secret_permissions      = ["Backup", "Delete", "get", "list", "purge", "recover", "restore", "set"]
  certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
  storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
}

output "id" {
  value     = azurerm_key_vault.key_vault.id
  sensitive = false
}
