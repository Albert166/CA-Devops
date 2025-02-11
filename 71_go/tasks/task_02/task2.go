package main

import (
	"fmt"
)

func displayodd(argument ...int) []int {
	arg := make([]int, 0)
	arg = append(arg, argument...)
	display := 0
	result := make([]int, 0)
	for i := 0; i < len(arg); i += 2 {
		display = arg[i]
		result = append(result, display)
	}
	return result
}

func main() {
	fmt.Println(displayodd(1, 220, 3, 450, 5, 620, 7, 890, 9, 501, 154))
}
