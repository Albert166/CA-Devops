variable resource_group_name {
  type        = string
  default     = ""
  description = "Resource Group Name"
}

variable region {
  type        = string
  default     = "polandcentral"
  description = "Region for the infrastructure"
  validation {
    condition = contains(["polandcentral","norwayeast","northeurope"], var.region)
    error_message = "You can choose from polandcentral, norwayeast or northeurope"
  }
}

variable network_interface {
  type        = string
  default     = "network_interface27"
  description = "Network Interface"
}

variable virtual_network_name {
  type        = string
  default     = ""
  description = "Virtual Network Name"
}

variable subnet_name {
  type        = string
  default     = ""
  description = "Name of the subnet"
}

variable vm_name {
  type        = string
  default     = ""
  description = "virtual Machine name"
}

variable machine_size {
  type        = string
  default     = "Standard_B1s"
  description = "VM size"
  validation {
    condition = contains(["Standard_B1ls","Standard_B1ms","Standard_B1s"], var.machine_size)
    error_message = "Value can contain only Standard_B1ls,Standard_B1ms,Standard_B1s"
  }
}
