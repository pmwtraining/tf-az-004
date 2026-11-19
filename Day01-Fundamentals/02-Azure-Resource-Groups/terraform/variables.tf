variable "resource_group_name" {
  description = "Name of the assigned student resource group."
  type        = string
}

variable "expected_location" {
  description = "Expected Azure region."
  type        = string
  default     = "norwayeast"
}
