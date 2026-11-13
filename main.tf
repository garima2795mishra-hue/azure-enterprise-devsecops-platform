
module "network" {
  source = "./modules/network"

  resource_group_name = "rg-azure-lb-lab"
  location            = "Central India"
}

module "vm" {
  source = "./modules/vm"

  resource_group_name = module.network.resource_group_name
  location            = "Central India"
  subnet_id           = module.network.backend_subnet_id

  admin_username = var.admin_username
  admin_password = var.admin_password
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  resource_group_name = module.network.resource_group_name
  location            = "Central India"
  nic_ids             = module.vm.nic_ids
}


module "applicationgateway" {
  source = "./modules/applicationgateway"

  resource_group_name = module.network.resource_group_name
  location            = "Central India"

  subnet_id            = module.network.appgateway_subnet_id
  backend_ip_addresses = module.vm.nic_private_ips
}

