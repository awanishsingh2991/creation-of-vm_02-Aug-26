data "azurerm_network_interface" "network-interface" {
    for_each = var.virt-machine
    name = each.value.int_name
    resource_group_name = each.value.rgn
}
