run "check_example_tag" {
    assert {
        condition = aws_instance.example.tags.Name == "${terraform.workspace}-Testing-state-file"
        error_message = "The tag name is not correct"
    }
}

run "check_environment_tag" {
    assert {
        condition = aws_instance.example.tags.Environment == "${terraform.workspace}"
        error_message = "The tag environment is not correct"
    }
}

run "check_instance_type" {
    assert {
        condition = aws_instance.example.instance_type == "t2.micro"
        error_message = "The instance type is not correct"
    }
}