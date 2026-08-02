resource "azurerm_network_interface" "network-interface" {
    for_each = var.nic
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rgn

  ip_configuration {
    name = each.value.ipname
    private_ip_address_allocation = each.value.pipaa  
   subnet_id = data.azurerm_subnet.subnetid[each.key].id
   public_ip_address_id = data.azurerm_public_ip.publicip[each.key].id
     }
}