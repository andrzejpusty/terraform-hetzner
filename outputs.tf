output "app_server_ip" {
  value = hcloud_server.devops_vm.ipv4_address
}

output "monitoring_server_ip" {
  value = hcloud_server.monitoring_vm.ipv4_address
}
