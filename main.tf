#------------------------------------------------------------------------------#
#                                                                              #
#                             main configuration                               #
#                                                                              #
#------------------------------------------------------------------------------#


#---------------------------#
#  modules call             #
#---------------------------#

#  Network module
module "vpc" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region

}

# VM module
module "vm" {
  source       = "./modules/vm"
  depends_on   = [module.vpc]
  vm_name      = var.vm_name
  vm_type      = var.vm_type
  vm_image     = var.vm_image
  subnet_name  = module.vpc.subnet_name
  network_name = module.vpc.vpc_name
  tags         = var.tags
  zone         = var.vm_zone

}

# TODO : GKE module

# TODO : gs bucket module

# TODO : bigquery module

