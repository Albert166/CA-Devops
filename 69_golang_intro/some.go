package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")

	fmt.Println("This" + " is" + " a" + " string.")

	fmt.Println("2+3=", +2+3)

	fmt.Println("5 / 2 =", 5/2)
	fmt.Println("3.0 / 2=", 3.0/2)

	fmt.Println(true && false)
	fmt.Println(true || false)
	fmt.Println(!true)
	fmt.Println(!false)

	const a = 2
	const b = "this is a string"
	const c = 2.5

	fmt.Println(a, b, c)

	fmt.Println("2 / 2.5 =", float64(a/c))

}
