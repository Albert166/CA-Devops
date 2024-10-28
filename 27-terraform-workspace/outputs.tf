output "vm_name" {
    description = "VM name"
    value       = azurerm_linux_virtual_machine.vm27l.name
}
output "private_ip_address" {
    description = "Private IP adress"
    value       = azurerm_linux_virtual_machine.vm27l.private_ip_address
}
output "machine_size" {
    description = "VM Machine Size"
    value       = azurerm_linux_virtual_machine.vm27l.size
}

output "location" {
    description = "VM location"
    value       = azurerm_linux_virtual_machine.vm27l.location
}