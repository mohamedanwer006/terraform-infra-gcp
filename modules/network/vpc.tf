#------------------------------------------------------------------------------#
#                                    VPC                                       #
#------------------------------------------------------------------------------#

resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = false
}



