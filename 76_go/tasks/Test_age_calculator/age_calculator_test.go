package main

import (
	"testing"
)

func TestAgeCalculator(t *testing.T) {
	result := age_calculator(1993)
	expected := 32
	if result != expected {
		t.Errorf("age_calculator(1993) = %d; want 32", result)
	} else {
		t.Log("Test passed")
	}
}
