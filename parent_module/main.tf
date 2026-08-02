module "rg" {
  source = "../child_module/resource_group"
  rgs    = var.rgs
}
module "virtual-network" {
  depends_on = [module.rg]
  source     = "../child_module/virtual_network"
  vnet       = var.vnet
}
module "subnetid" {
  depends_on = [module.virtual-network]
  source     = "../child_module/subnet_id"
  subid      = var.subid
}
module "publicip" {
  depends_on = [module.rg]
  source     = "../child_module/private_ip"
  pub-ip     = var.pub-ip
}
module "network-interface" {
  depends_on = [module.subnetid]
  source     = "../child_module/network-interface"
  nic        = var.nic
}
module "netsecgroup" {
  depends_on    = [module.network-interface]
  source        = "../child_module/network_sec_group"
  net-sec-group = var.net-sec-group
}
module "associatio1" {
  depends_on = [module.network-interface, module.publicip]
  source     = "../child_module/associates"
  associate  = var.associate
}
module "virtual-machine" {
  depends_on   = [module.network-interface]
  source       = "../child_module/virtual_machine"
  virt-machine = var.virt-machine
}
