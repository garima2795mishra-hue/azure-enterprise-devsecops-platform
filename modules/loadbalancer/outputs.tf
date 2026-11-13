
output "load_balancer_public_ip" {
  value = azurerm_public_ip.lb.ip_address
}

output "load_balancer_id" {
  value = azurerm_lb.main.id
}
