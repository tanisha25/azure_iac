variable "base_app_name" {
    type = string
    description = "Application name that is used as a base of all the resource names"
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "env_name" {
  description = "Env. value defined in global.variables.tfvars in terraform root directory"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = string
}