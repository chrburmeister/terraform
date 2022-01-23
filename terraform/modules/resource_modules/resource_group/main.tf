resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

output "location" {
  value     = azurerm_resource_group.resource_group.location
  sensitive = false
}

output "name" {
  value     = azurerm_resource_group.resource_group.name
  sensitive = false
}

output "id" {
  value     = azurerm_resource_group.resource_group.id
  sensitive = false
}
