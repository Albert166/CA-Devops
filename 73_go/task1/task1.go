package main

import "fmt"

func main() {
	x := 5
	p := &x
	fmt.Println("Original value:", x)
	*p = x * 5
	fmt.Println("Modified value:", x)

}
