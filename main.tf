module "creating-random-name" {
    source = "./modules/random-name"
}

locals {
    random-name = module.creating-random-name.result
}

module "creating-resource-group" {
  source             = "./modules/resource-group"
  resource_group_name = "${var.base_app_name}-${var.env_name}-rg-${local.random-name}"
  location           = var.location
  tags = var.tags
}

module "creating-virtual-network" {
  source             = "./modules/virtual-network"
  resource_group_name = module.creating-resource-group.resource_group_name
  location            = var.location
  vnet_name           = "${var.base_app_name}-${var.env_name}-vnet-${local.random-name}"
  address_space       = var.address_space
  tags = var.tags
  subnet_name         = "${var.base_app_name}-${var.env_name}-subnet-${local.random-name}"
}

module "creating-storage-account" {
  source               = "./modules/storage-account"
  storage_account_name = "${var.base_app_name}${var.env_name}adls${local.random-name}"
  resource_group_name  = module.creating-resource-group.resource_group_name
  location             = var.location
  subnet_id            = module.creating-virtual-network.subnet_id
  tags = var.tags
}


