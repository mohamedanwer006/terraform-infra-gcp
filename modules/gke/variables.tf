#------------------------------------------------------------------------------#
#                                    GKE variable                              #
#------------------------------------------------------------------------------#

variable "project_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}


variable "pods_ipv4_cidr_block" {
  type    = string
  default = "10.48.0.0/14"
  description = "default pods ipv4 cidr block value = 10.48.0.0/14"
}
variable "services_ipv4_cidr_block" {
  type    = string
  default = "10.52.0.0/20"
  description = "default services ipv4 cidr block value = 10.52.0.0/20 "
}



variable "master_authorized_networks_cidr" {
  type = string
}



# Cluster region
variable "region" {
  type        = string
}

# Cluster zones list
variable "zones" {
  type        = list(string)
  description = "list of zones to deploy the zonal cluster first zone will be used for master"
}

# Machine type
variable "machine_type" {
  type        = string
}

# Number of nodes per zone
variable "nodes_per_zone" {
  type        = number
}

# Cluster name 
variable "cluster_name" {
  type        = string
}

# Master node cidr
variable "master_cidr" {
  type        = string
}

variable "boot_disk_size" {
  type = number
  default = 100
  description = "default boot disk size = 100"
}

variable "service_account_email" {  
  type = string
}
