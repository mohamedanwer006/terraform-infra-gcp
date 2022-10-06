#------------------------------------------------------------------------------#
#                                    VM                                        #
#------------------------------------------------------------------------------#

resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.vm_type
  zone         = var.zone
  tags = var.tags


  boot_disk {
    initialize_params {
      image = var.vm_image
    }
     
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
    # uncomment to assignment public ip
    # access_config {
    #   // Ephemeral public IP
    # }
  }

  labels = {
    "name" = "${var.vm_name}"
  }

}
