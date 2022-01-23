variable "name" {
  type        = string
  description = "A valid name for a key_vault"
}

variable "location" {
  type        = string
  description = "A valid Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Name if Azure Resource Group"
}

variable "sku_name" {
  type        = string
  description = "A valid SKU Name"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Can Azure Disk Encryption retrieve secrets from the Key Vault?"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Can Azure Virtual Machines retrieve certificates stored as secrets from the Key Vault?"
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Can Azure Resource Manager retrieve secrets from the Key Vault?"
}

variable "tags" {
  type        = map(string)
  description = "Dictionary of relevant tags"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
  default     = ""
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft delete retention days"
  default     = 30
}

variable "network_acls_default_action" {
  type        = string
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny"
  default     = "Allow"
}
variable "network_acls_bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"
  default     = "AzureServices"
}
variable "access_policies" {
  type = list(object({
    object_id   = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
}
