variable environment { 
    type = string 
    default = "prod"
}


module prod {
    source                   = "../modules"
    region                   = "northeurope"
    resource_group_name      = "${var.environment}-rsgp"
    virtual_network_name     = "${var.environment}-vpc"
    subnet_name              = "${var.environment}-subnet"
    vm_name                  = "${var.environment}-vm"
    machine_size             = "Standard_B1s"
}