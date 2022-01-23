resource "azurerm_key_vault_secret" "secret" {
  name         = var.name
  value        = var.value
  key_vault_id = var.key_vault_id
}

output "id" {
  value     = azurerm_key_vault_secret.secret.id
  sensitive = false
}
output "version" {
  value     = azurerm_key_vault_secret.secret.version
  sensitive = false
}
output "versionless_id" {
  value     = azurerm_key_vault_secret.secret.versionless_id
  sensitive = false
}
