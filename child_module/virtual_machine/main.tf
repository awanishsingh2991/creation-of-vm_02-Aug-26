resource "azurerm_linux_virtual_machine" "linvm" {
  for_each = var.virt-machine
  name                = each.value.name
  resource_group_name = each.value.rgn
  location            = each.value.loc
  size                = "Standard_D2s_v3"

  admin_username = "adminuser"
  admin_password = "Awanish123456"
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.network-interface[each.key].id]

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