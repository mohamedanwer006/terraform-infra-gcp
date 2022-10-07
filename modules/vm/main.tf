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
  service_account {
    email =var.service_account_email 
    scopes = ["cloud-platform"] 
  }
  

  labels = {
    "name" = "${var.vm_name}"
  }

#  Use startup script to tinyproxy as a reverse proxy to allow access to gke cluster
  metadata_startup_script = <<EOF
  #!/bin/bash
  yum install -y tinyproxy
  echo "Allow localhost"| tee -a /etc/tinyproxy/tinyproxy.conf
  systemctl restart tinyproxy
  EOF
}
