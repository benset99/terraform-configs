provider "azurerm" {
	features {}
}

resource "azurerm_resource_group" "web1" {
	name		= "${var.prefix}-resources"	
	location	= "${var.location}"
}

resource "azurerm_container_group" "neat" {
	name				= "${var.prefix}-contest"	
	location			= "${azurerm_resource_group.web1.location}"
	resource_group_name = "${azurerm_resource_group.web1.name}"
	ip_address_type		= "public"
	dns_name_label		= "${var.prefix}-contest"
	os_type				= "linux"

	container {
		name	= "${var.prefix}-nginx"
		image	= "nginx"
		cpu		= "0.5"
		memory	= "1.5"

		ports {
			port		= 80
			protocol	= "TCP" 
		}
	}

	tags = {
		environment = "testing"
	}
}
