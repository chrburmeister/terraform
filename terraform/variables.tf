# tags
variable "tags" {
  type        = map(any)
  description = "Tags for Azure resouces"
}

# general information
variable "tenant_id" {
  type        = string
  description = "Azure tenant id"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription id"
}

variable "client_id" {
  type        = string
  description = "Azure AD Service Principal that is being used to deploy and manage the resources"
}

variable "client_secret" {
  type        = string
  description = "Azure AD Service Principal secret that is being used to deploy and manage the resources"
}

variable "location" {
  type        = string
  description = "Azure region to use"
}

variable "environment" {
  type        = string
  description = "Name of the environment - dev / test / prod"
}
