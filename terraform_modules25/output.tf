output "vm_name_prod" {
    description = "VM name prod"
    value       = module.prod.vm_name_prod
}
output "private_ip_adress_prod" {
    description = "Private IP adress prod"
    value       = module.prod.private_ip_address_prod
}
output "machine_size_prod" {
    description = "VM Machine Size prod"
    value       = module.prod.machine_size_prod
}

output "location_prod" {
    description = "VM location prod"
    value       = module.prod.location_prod
}



output "vm_name_stage" {
    description = "VM name prod"
    value       = module.stage.vm_name_stage
}
output "private_ip_address_stage" {
    description = "Private IP adress prod"
    value       = module.stage.private_ip_address_stage
}
output "machine_size_stage" {
    description = "VM Machine Size prod"
    value       = module.stage.machine_size_stage
}

output "location_stage" {
    description = "VM location prod"
    value       = module.stage.location_stage
}



output "vm_name_test" {
    description = "VM name prod"
    value       = module.test.vm_name_test
}
output "private_ip_address_test" {
    description = "Private IP adress prod"
    value       = module.test.private_ip_address_test
}
output "machine_size_test" {
    description = "VM Machine Size prod"
    value       = module.test.machine_size_test
}

output "location_test" {
    description = "VM location prod"
    value       = module.test.location_test
}