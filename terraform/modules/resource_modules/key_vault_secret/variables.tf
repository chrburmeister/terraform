variable "name" {
  type        = string
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}
variable "value" {
  type        = string
  description = "Specifies the value of the Key Vault Secret."
}
variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault where the Secret should be created."
}
