locals {
    required_tags = {
        project = var.project_name
        environment = var.environment
    }
    tags = merge(var.resource_tags, local.required_tags)
    name_suffix = "${var.project_name}-${var.environment}"
}

resource "aws_instance" "app_server" {
    ami = "ami-0d118c6e63bcb554e"
    instance_type = "t2.micro"
    tags = "${merge(local.tags, {Name = "app-server-${local.name_suffix}"})}"
}

resource "aws_instance" "backend_server" {
    ami = "ami-0d118c6e63bcb554e"
    instance_type = "t2.micro"
    tags = "${merge(local.tags, {Name = "backend-server-${local.name_suffix}"})}" 
}
