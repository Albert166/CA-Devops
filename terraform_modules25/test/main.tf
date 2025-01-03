variable environment { 
    type = string 
    default = "test"
}


module test {
    source                  = "../modules"
    region                  = "polandcentral"
    resource_group_name     = "${var.environment}_rsgp"
    virtual_network_name    = "${var.environment}_vpc"
    subnet_name             = "${var.environment}subnet"
    vm_name                 = "${var.environment}-vm"
    machine_size            = "Standard_B1s"
}