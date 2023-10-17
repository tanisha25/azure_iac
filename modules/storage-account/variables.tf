variable "storage_account_name" {
  description = "The name of the Data Lake Storage account. Must be unique within Azure."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Data Lake Storage account."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "The ID of the subnet in which the ADLS storage account should reside."
  type        = string
}