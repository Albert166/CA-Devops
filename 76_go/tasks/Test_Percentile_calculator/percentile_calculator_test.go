package main

import "testing"

func TestPercentile_calculator(t *testing.T) {
	result := percentile_calculator(10, 50)
	if result != 5 {
		t.Errorf("percentile_calculator(10, 50) = %f; want 5", result)
	} else {
		t.Log("Test passed")
	}
}
