package main

import "testing"

func TestNameSurname(t *testing.T) {
	result := name_surname("John", "Doe")
	expected := "John Doe"
	if result != expected {
		t.Errorf("name_surname('John', 'Doe') = %s; want 'John Doe'", result)
	} else {
		t.Log("TestNameSurname passed")
	}
}
