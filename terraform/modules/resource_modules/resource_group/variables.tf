variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "resource_group"
}
variable "location" {
  type        = string
  description = "Azure Location"
  default     = null
}
variable "tags" {
  type        = map(any)
  description = "Tags"
  default     = {}
}