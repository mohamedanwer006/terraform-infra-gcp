GCP gke cluster module
====
This module creates a GKE cluster with a node pool


Usage
---

```v
module "cluster" {
  source                          = "./modules/gke"
  cluster_name                    = "vois-cluster"
  project_id                      = "project_id"
  network_name                    = "vpc_name"
  subnet_name                     = "subnet_name"
  region                          = "us-central1"
  zones                           = ["us-central1-c", "us-central1-f"]
  machine_type                    = "n1-standard-1"
  nodes_per_zone                  = 2
  master_authorized_networks_cidr = "10.0.0.0/24" 
  boot_disk_size                  = 100
  master_cidr                     = "172.16.0.0/28"
  service_account_email           = "google_service_account_email"
}

```