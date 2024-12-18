output IP_1 {
    description = "Public Ip of the ec2 instance 1"
    value = module.ec_1.public_ip
}

output IP_2 {
    description = "Public Ip of the ec2 instance 2"
    value = module.ec_2.public_ip
}

output IP_3 {
    description = "Public Ip of the ec2 instance 3"
    value = module.ec_3.public_ip
}