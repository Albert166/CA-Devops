package main

import "fmt"

func DoubleValue(p *int) {
	*p = *p * 2
	fmt.Println("Modified Value:", *p)
}

func main() {
	x := 10
	fmt.Println("Original Value:", x)
	p := &x
	DoubleValue(p)

}
