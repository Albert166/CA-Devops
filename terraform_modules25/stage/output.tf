output "vm_name_stage" {
    description = "VM name prod"
    value       = module.stage.vm_name
}
output "private_ip_address_stage" {
    description = "Private IP adress prod"
    value       = module.stage.private_ip_address
}
output "machine_size_stage" {
    description = "VM Machine Size prod"
    value       = module.stage.machine_size
}

output "location_stage" {
    description = "VM location prod"
    value       = module.stage.location
}