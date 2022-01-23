variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "location" {
  type        = string
  description = "Default location where resources are deployed. List available locations using 'az account list-locations --output table'."
}

variable "name" {
  type        = string
  description = "Name of the storage account"
}

variable "account_tier" {
  type        = string
  description = "Account Tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Account Replication Type; e.g. LRS (Locally Redundant Storage) or GRS (Globally Redundant Storage)"
}

variable "is_hns_enabled" {
  type = bool
  default = false
}

variable "container_access_type" {
  type        = string
  description = "Access type of the container"
  default     = "private"
}

variable "tags" {
  type        = map(string)
  description = "Dictionary of relevant tags"
}

variable "network_rule_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
}
variable "network_rule_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
}
variable "network_rule_virtual_network_subnet_ids" {
  type        = list(string)
  description = "A list of resource ids for subnets."
}
variable "network_rule_bypass" {
  type        = list(string)
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
}