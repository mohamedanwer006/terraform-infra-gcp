#------------------------------------------------------------------------------#
#                                    Subnet                                    #
#------------------------------------------------------------------------------#

resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  private_ip_google_access = true
  region                   = var.region
  network                  = google_compute_network.vpc.name
  ip_cidr_range            = var.subnet_cidr
}
