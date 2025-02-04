package main

import (
	"fmt"
)

var word string
var word2 string = "word2"

var isTrue bool

var isFalse bool = false

var x int

var x2 int = 2

var y float64

var y2 float64 = 2.0

var I string = "I"
var can string = " can"
var going string = " go"
var home string = " home"
var sentence string = I + can + going + home

func main() {
	fmt.Println(sum(1, 2))
	fmt.Println(division(1, 2))
	fmt.Println(substraction(1, 2))
	fmt.Println(multiplication(1, 2))
	isTrue1 := true
	word1 := "word1"
	x1 := 1
	y1 := 1.0
	fmt.Println(word1, isTrue1, x1, y1)
	fmt.Println(sentence)

}

func sum(a int, b int) int {
	return int(a + b)
}

func division(a int, b float32) (float32, string) {
	if b == 0 {
		return 0, "Cannot divide by zero"
	}
	return float32(a) / b, ""
}

func substraction(a float64, b float32) float32 {
	return float32(a) - b
}

func multiplication(a float64, b float32) float32 {
	return float32(a) * b
}
