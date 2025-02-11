package main

import "fmt"

func sum_and_number(number ...int) (string, int, string, int) {
	sum := 0
	for _, num := range number {
		sum += num
	}

	numberlen := len(number)
	sumstr := "Sum is :"
	lengthstrin := "Count of arguments :"
	return sumstr, sum, lengthstrin, numberlen
}

func main() {
	fmt.Println(sum_and_number(1, 5, 8, 9, 7, 10, 12))
}
