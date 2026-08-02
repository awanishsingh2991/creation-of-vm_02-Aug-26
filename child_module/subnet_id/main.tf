resource "azurerm_subnet" "subnetid" {
    for_each = var.subid
  name = each.value.name
  resource_group_name = each.value.rgn
  virtual_network_name = each.value.vnn
address_prefixes = each.value.ap
}
