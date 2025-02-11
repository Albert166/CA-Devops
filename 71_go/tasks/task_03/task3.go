package main

import "fmt"

func chairs(x int) int {
	if x == 1 {
		return 1
	}
	return x + chairs(x-2)
}

func main() {
	fmt.Println(chairs(9))

}
