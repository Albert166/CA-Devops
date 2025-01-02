run "check_example_tag" {
    assert {
        condition = aws_instance.example.tags.Name == "Testing-state-file"
        error_message = "The tag name is not correct"
    }
}