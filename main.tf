#------------------------------------------------------------------------------#
#                                                                              #
#                             main configuration                               #
#                                                                              #
#------------------------------------------------------------------------------#


#---------------------------#
#  module calls             #
#---------------------------#

#  Network module
module "vpc" {
  source      = "./modules/network"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region

}
#------------------------------------------------------------------------------#
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
  service_account_email = module.gs_sa.email

}
#------------------------------------------------------------------------------#
# GKE module
module "cluster" {
  source                          = "./modules/gke"
  cluster_name                    = "vois-cluster"
  project_id                      = var.project_id
  network_name                    = module.vpc.vpc_name
  subnet_name                     = module.vpc.subnet_name
  region                          = "us-central1"
  zones                           = ["us-central1-c", "us-central1-f"]
  machine_type                    = "n1-standard-1"
  nodes_per_zone                  = 2
  master_authorized_networks_cidr = "10.0.0.0/24" // allow only from the IAP
  boot_disk_size                  = 100
  master_cidr                     = "172.16.0.0/28"
  service_account_email           = module.gke_sa.email
}

# gke Service Account        
module "gke_sa" {
  source = "./modules/service_account"
  project_id = var.project_id
  account_id = "kubernetes"
  display_name = "kubernetes"
  role = "roles/storage.objectViewer" 
}

#------------------------------------------------------------------------------#
#  gs bucket module
module "gs_bucket" {
  source             = "./modules/gs_bucket"
  resource_count               = 3
  bucket_name        = "gs-bucket-"
  region             = "us-central1"
  storage_class      = "STANDARD"
  versioning_enabled = false
}

# gs Service Account         
module "gs_sa" {
  source = "./modules/service_account"
  project_id = var.project_id
  account_id = "googlstorage"
  display_name = "googlstorage"
  role = "roles/container.developer" 
}
#------------------------------------------------------------------------------#
# bigquery module
module "bq_dataset" {
  source                = "./modules/bigquery"
  resource_count               = 3
  dataset_name          = "bq_dataset_"
  region                = var.region
  service_account_email = module.bq_sa.email

}
# bigQuery Service Account   
module "bq_sa" {
  source = "./modules/service_account"
  project_id = var.project_id
  account_id = "bigquery"
  display_name = "bigquery"
  role = "roles/bigquery.dataViewer"
}
