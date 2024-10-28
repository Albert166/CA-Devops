resource "azurerm_resource_group" "rgroup27l" {
  name     = "${var.resource_group_name}_${terraform.workspace}"
  location = var.region
}

resource "azurerm_virtual_network" "vn27l" {
  name                = "${var.virtual_network_name}_${terraform.workspace}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgroup27l.location
  resource_group_name = azurerm_resource_group.rgroup27l.name
}

resource "azurerm_subnet" "sbnet27l" {
  name                 = "${var.subnet_name}_${terraform.workspace}"
  resource_group_name  = azurerm_resource_group.rgroup27l.name
  virtual_network_name = azurerm_virtual_network.vn27l.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "ni27l" {
  name                = "${var.network_interface}_${terraform.workspace}"
  location            = azurerm_resource_group.rgroup27l.location
  resource_group_name = azurerm_resource_group.rgroup27l.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sbnet27l.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm27l" {
  name                = "${var.vm_name}${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rgroup27l.name
  location            = azurerm_resource_group.rgroup27l.location
  size                = var.machine_size
  admin_username      = "albert"
  network_interface_ids = [
    azurerm_network_interface.ni27l.id,
  ]

  admin_ssh_key {
    username   = "albert"
    public_key = file("/home/albert/.ssh/disposable.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}