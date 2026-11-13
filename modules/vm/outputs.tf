
output "vm_ids" {
  value = azurerm_linux_virtual_machine.web_vm[*].id
}

output "nic_ids" {
  value = azurerm_network_interface.vm_nic[*].id
}

output "nic_private_ips" {
  value = azurerm_network_interface.vm_nic[*].private_ip_address
}
