data "azurerm_subnet" "subnetid" {
    for_each = var.nic
    name = each.value.sub-name
   resource_group_name = each.value.rgn
   virtual_network_name = each.value.vnn
}
data "azurerm_public_ip" "publicip" {
    for_each = var.nic
    name = each.value.public_ip
    resource_group_name = each.value.rgn 
}