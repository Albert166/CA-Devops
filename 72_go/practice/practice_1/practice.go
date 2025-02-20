package main

import "fmt"

func main() {
	// Initialize map with string keys and int values
	m := make(map[string]int)

	// Add key-value pairs
	m["k1"] = 7
	m["k2"] = 13
	m["k3"] = 21
	m["k4"] = 25

	// Print initial map
	fmt.Println("map:", m)

	// Get values by key
	v1 := m["k1"]
	fmt.Println("v1:", v1)

	v3 := m["k3"]
	fmt.Println("v3:", v3)

	// Print map length
	fmt.Println("len:", len(m))

	// Delete a key
	delete(m, "k2")
	fmt.Println("map after delete:", m)

	// Clear the map
	clear(m)
	fmt.Println("map after clear:", m)
}
