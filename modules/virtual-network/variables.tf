variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = string
}

variable "subnet_prefix" {
  description = "The address space for the virtual network."
  type        = string
  default = "10.0.1.0/24"
}


variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}