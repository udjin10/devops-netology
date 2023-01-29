output "internal_ip_address_vm01_yandex_cloud" {
  value = yandex_compute_instance.vm01.network_interface.0.ip_address
}

output "external_ip_address_vm01_yandex_cloud" {
  value = yandex_compute_instance.vm01.network_interface.0.nat_ip_address
}
output "internal_ip_address_vm-2_yandex_cloud" {
  value = yandex_compute_instance.vm02.network_interface.0.ip_address
}

output "external_ip_address_vm-2_yandex_cloud" {
  value = yandex_compute_instance.vm02.network_interface.0.nat_ip_address
}
