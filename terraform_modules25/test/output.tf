output "vm_name_test" {
    description = "VM name prod"
    value       = module.test.vm_name
}
output "private_ip_address_test" {
    description = "Private IP adress prod"
    value       = module.test.private_ip_address
}
output "machine_size_test" {
    description = "VM Machine Size prod"
    value       = module.test.machine_size
}

output "location_test" {
    description = "VM location prod"
    value       = module.test.location
}