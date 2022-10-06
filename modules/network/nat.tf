#------------------------------------------------------------------------------#
#                                 NAT gateway                                  #
#------------------------------------------------------------------------------#

# Create a public ip for nat service

resource "google_compute_address" "nat_ip" {
  name = "nat-ip"
  region  = var.region
}



resource "google_compute_router" "nat_router" {
  name = "nat-router"
  network = google_compute_network.vpc.name
}

resource "google_compute_router_nat" "nat_gateway" {
  name = "nat-gateway"
  router = google_compute_router.nat_router.name

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = [ google_compute_address.nat_ip.self_link ]

    #'LIST_OF_SUBNETWORKS': A list of SubnetWorks are 
    # allowed to Nat (specified in the field subnetwork below)

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 
  subnetwork { 
     name = google_compute_subnetwork.subnet.id
     source_ip_ranges_to_nat = [ var.subnet_cidr ] # "ALL_IP_RANGES"
  }

  depends_on = [ google_compute_address.nat_ip ]
}

