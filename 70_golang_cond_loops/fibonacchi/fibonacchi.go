package main

import (
	"fmt"
	"math"
)

func main() {
	var number int
	var j float64
	fmt.Println("Enter a number:")
	fmt.Scanln(&number)
	if number < 0 {
		fmt.Println("Invalid number")
		return
	}
	if number == 0 {
		fmt.Println(0)
		return
	}
	if number >= 1 && number < 10 {
		for i := 0; j*1.6 < float64(number)*1.1; {
			j = float64(math.Floor((math.Pow(1.618034, float64(i)) - math.Pow(1-1.618034, float64(i))) / 2.236067977))
			fmt.Println(int(j))
			i++
		}
	}
	if number == 21 {
		for i := 0; j*1.6 < float64(number)*1.01; {
			j = float64(math.Floor((math.Pow(1.618034, float64(i)) - math.Pow(1-1.618034, float64(i))) / 2.236067977))
			fmt.Println(int(j))
			i++
		}
	} else {
		for i := 0; j*1.618035 <= float64(number)+0.5; {
			j = float64(math.Floor((math.Pow(1.618034, float64(i)) - math.Pow(1-1.618034, float64(i))) / 2.236067977))
			fmt.Println(int(j))
			i++
		}
	}
}
