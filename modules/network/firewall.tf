#------------------------------------------------------------------------------#
#                                    Firewall                                  #
#------------------------------------------------------------------------------#


resource "google_compute_firewall" "fw_allow_ssh" {
  name    = "vois-allow"
  network = google_compute_network.vpc.name
  # SSH
 
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  # HTTP/s
  # allow {
  #   protocol = "tcp"
  #   ports    = ["80", "443"]
  # }

  # Allow traffic from google IAP 
  source_ranges = ["35.235.240.0/20"] // allow only from the IAP

  // No target_tags to apply to all instances 
# Allow all egress
}

#  allow all egress
resource "google_compute_firewall" "fw_allow_all_egress" {
  name    = "vois-allow-all-egress"
  network = google_compute_network.vpc.name
  direction = "EGRESS"
  allow {
    protocol = "all"
  }
}
