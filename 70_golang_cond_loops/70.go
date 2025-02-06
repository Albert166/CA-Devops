package main

import (
	"fmt"
)

func main() {
	for i := 0; i < 10; i++ {
		if i%2 == 0 {
			fmt.Println("7 is even")
		} else {
			fmt.Println("7 is odd")
		}
	}

	if 8%4 == 1 {
		fmt.Println("8 is divisible by 4")
	} else {
		fmt.Println("8 is not divisible by 4")
	}
}
