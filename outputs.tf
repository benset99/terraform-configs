output "ip_address" {
	value = "${azurerm_container_group.neat.ip_address}"
}

output "fqdn" {
	value = "${azurerm_container_group.neat.fqdn}"
}

