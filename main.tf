#------------------------------------------------------------------------------#
#                                                                              #
#                             main configuration                               #
#                                                                              #
#------------------------------------------------------------------------------#


#---------------------------#
#  modules call             #
#---------------------------#

module "vpc" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}
