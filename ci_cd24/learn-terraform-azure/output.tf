output "vm_name" {
    value = azurerm_linux_virtual_machine.tfvm.name
}
output "private_ip_adress" {
    value = azurerm_linux_virtual_machine.tfvm.private_ip_address
}
output "size" {
    value = azurerm_linux_virtual_machine.tfvm.size
}