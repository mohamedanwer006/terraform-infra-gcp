VM module 
===

Create a GCP VM instance 

Usage 
---

```v

module "module_name" {
  source       = "./modules/vm"
  vm_name      = "vm_name"
  vm_type      = "vm_type"
  vm_image     = "vm_image"
  subnet_name  = "subnet_name"
  network_name = "vpc_name"
  tags         = "tags"
  zone         = "vm_zone"

}

```
