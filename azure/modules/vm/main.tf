resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-nic-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }

}

resource "azurerm_public_ip" "main" {
  name                = "${var.prefix}-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = var.prefix
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = var.prefix
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.main.id]
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  computer_name                   = var.prefix
  priority                        = "Spot"
  eviction_policy                 = "Deallocate"

  source_image_reference {
    publisher = "debian"
    offer     = "debian-11"
    sku       = "11"
    version   = "latest"
  }

  os_disk {
    name                 = "os-${var.prefix}-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "50"

  }

}
