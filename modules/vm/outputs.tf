#------------------------------------------------------------------------------#
#                                    Outputs                                   #
#------------------------------------------------------------------------------#


output "vm_internal_ip" {
    value = google_compute_instance.vm.*.network_interface.0.network_ip
}