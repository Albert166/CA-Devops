package main

import "fmt"

func sumsum(a, b int) int {
	return a + b
}

func sumsumsum(a, b, c int) int {
	return a + b + c
}

func sumvar(number ...int) int {
	total := 0
	for _, number := range number {
		total += number
	}
	return total
}

func multReturn() (int, string) {
	return 8, "nine"
}

func testcount(a int) int {
	if a == 11 {
		return 11
	}
	fmt.Println(a)
	return testcount(a + 1)
}

func fibo(x int) int {
	if x == 0 {
		return 0
	}
	if x == 1 {
		return 1
	}
	return fibo(x-1) + fibo(x-2)
}

func main() {
	res := sumsum(3, 4)
	fmt.Println(res)
	ress := sumsumsum(3, 4, 10)
	fmt.Println(ress)
	resss := sumvar(3, 4, 10, 20, 30)
	fmt.Println(resss)
	a, b := multReturn()
	fmt.Println("A =", a, ",B =", b)
	fmt.Println(testcount(0))
	fmt.Println(fibo(6))
}
