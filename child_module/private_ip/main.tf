resource "azurerm_public_ip" "publicip" {
    for_each = var.pub-ip
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rgn
    allocation_method = each.value.am
}