data "azurerm_resource_group" "student" {
  name = var.resource_group_name
}

output "resource_group_name" {
  value = data.azurerm_resource_group.student.name
}

output "resource_group_location" {
  value = data.azurerm_resource_group.student.location
}

output "resource_group_tags" {
  value = data.azurerm_resource_group.student.tags
}

output "location_check" {
  value = lower(data.azurerm_resource_group.student.location) == lower(var.expected_location)
}
