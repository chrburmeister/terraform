module "key_vault" {
  source                          = "../../resource_modules/key_vault"
  resource_group_name             = var.resource_group_name
  key_vault_name                  = var.name
  location                        = var.location
  sku_name                        = var.sku_name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tags                            = var.tags
  tenant_id                       = var.tenant_id
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  network_acls_default_action     = var.network_acls_default_action
  network_acls_bypass             = var.network_acls_bypass
}

module "key_vault_access_policy" {
  source                  = "../../resource_modules/key_vault_access_policy"
  for_each                = { for policy in var.access_policies : policy.name => policy }
  key_vault_id            = module.key_vault.id
  tenant_id               = var.tenant_id
  object_id               = each.value.object_id
  key_permissions         = each.value.key_permissions
  secret_permissions      = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions
  storage_permissions     = each.value.storage_permissions
}
