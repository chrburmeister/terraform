variable "key_vault_id" {
  type        = string
  description = "Specifies the id of the Key Vault resource. Changing this forces a new resource to be created."
}
variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Changing this forces a new resource to be created."
}
variable "object_id" {
  type        = string
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Changing this forces a new resource to be created."
}
variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
}
variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions, must be one or more from the following: Backup, Delete, get, list, purge, recover, restore and set."
}
variable "certificate_permissions" {
  type        = list(string)
  description = "List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update."
}
variable "storage_permissions" {
  type        = list(string)
  description = "List of storage permissions, must be one or more from the following: Backup, Delete, DeleteSAS, Get, GetSAS, List, ListSAS, Purge, Recover, RegenerateKey, Restore, Set, SetSAS and Update."
}
