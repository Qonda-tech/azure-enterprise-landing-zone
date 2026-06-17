output "vnet_name" {
  value = azurerm_virtual_network.enterprise.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.enterprise.address_space
}