# locals
locals {
  resource_group_name  = "comp-base-${var.environment}-rg"
  storage_account_name = "compbase${var.environment}st"
  key_vault_name       = "comp-base-${var.environment}-kv"
}

# base rg
module "base_rg" {
  source              = "./modules/resource_modules/resource_group"
  resource_group_name = local.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "storage_account" {
  source                                  = "./modules/resource_modules/storage_accountv2"
  resource_group_name                     = module.base_rg.name
  location                                = var.location
  name                                    = local.storage_account_name
  account_replication_type                = "LRS"
  network_rule_default_action             = "Allow"
  network_rule_ip_rules                   = []
  network_rule_virtual_network_subnet_ids = []
  network_rule_bypass                     = ["AzureServices"]
  tags                                    = var.tags
}


module "key_vault" {
  source                          = "./modules/service_modules/key_vault"
  resource_group_name             = module.base_rg.name
  name                            = local.key_vault_name
  location                        = var.location
  sku_name                        = "standard"
  enabled_for_disk_encryption     = false
  enabled_for_deployment          = false
  enabled_for_template_deployment = false
  tenant_id                       = var.tenant_id
  purge_protection_enabled        = false
  soft_delete_retention_days      = 7
  network_acls_default_action     = "Allow"
  network_acls_bypass             = "AzureServices"
  access_policies                 = []
  tags                            = var.tags
}
