resource "azurerm_resource_group" "main" {
  name     = "rg-k3s-test"
  location = "eastus"
}

resource "azurerm_virtual_network" "main" {
  name                = "k3s-network"
  address_space       = var.address_space
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_prefixes
}

locals {
  vms = ["corvo"]
}

module "vm" {
  source = "./modules/vm"

  for_each            = toset(local.vms)
  prefix              = each.value
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = azurerm_subnet.internal.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}