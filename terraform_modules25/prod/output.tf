output "vm_name_prod" {
    description = "VM name prod"
    value       = module.prod.vm_name
}
output "private_ip_address_prod" {
    description = "Private IP adress prod"
    value       = module.prod.private_ip_address
}
output "machine_size_prod" {
    description = "VM Machine Size prod"
    value       = module.prod.machine_size
}

output "location_prod" {
    description = "VM location prod"
    value       = module.prod.location
}