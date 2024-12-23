variable aws_region {
    description = "The AWS region to use"
    type = string
    default = "eu-west-2"
}

variable "resource_tags" {
    description = "Tags to set for all resources"
    type = map(string)
    default = {}
}

variable "project_name" {
    description = "Name of the project."
    type = string
    default = "my-project"
}

variable "environment" {
    description = "Name of the environment."
    type = string
    default = "dev"
}